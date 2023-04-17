import 'dart:async';
import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/download_result/download_result.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/errors/added_ticket_error.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:collection/collection.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/repositories/ticket_repository.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';

class TicketStorageModel extends ElementaryModel {
  final ITicketRepository _ticketRepository;
  List<Ticket> _ticketList = [];
  final StreamController<List<Ticket>> _ticketDataChanged =
      StreamController.broadcast();
  final StreamController<String> _errorsOnDownloading =
      StreamController.broadcast();

  TicketStorageModel({
    required ITicketRepository ticketRepository,
  }) : _ticketRepository = ticketRepository;

  //* --------- GETTERS ----------------

  Stream<List<Ticket>> get ticketDataChanged => _ticketDataChanged.stream;
  Stream<String> get errorsOnDownloading => _errorsOnDownloading.stream;

  //? Всегда отдаём новый (скопированный) лист, чтобы список в модели и список в виджет-модели не ссылались на одно и то же
  List<Ticket> get ticketList => List.from(_ticketList);

  //* ----------------------------------

  //* -------- Inherit Functions -------

  int getTicketIndex(String ticketUrl) {
    return _ticketList.indexWhere((ticket) => ticket.url == ticketUrl);
  }

  //? Изменяем данные билета и уведомляем ui через stream, так же обновляем данные в БД
  Ticket _changeTicketAndNotify(
    Ticket newTicketData, {
    bool updateInDatabase = false,
  }) {
    final ticketIndex = getTicketIndex(newTicketData.url);
    _ticketList[ticketIndex] = newTicketData;
    _ticketDataChanged.add(List.from(_ticketList));
    if (updateInDatabase) {
      _ticketRepository.updateTicket(newTicketData);
    }
    return newTicketData;
  }

  //* ----------------------------------

  Future<List<Ticket>> initializeSavedTickets() async {
    final ticketsFolder = await getTemporaryDirectory();
    var savedTickets = await _ticketRepository.getTicketsFromDatabase();
    for (var i = 0; i < savedTickets.length; i++) {
      final ticket = savedTickets[i];
      // **********************
      //? Если в базе данных есть недокачанные билеты, обнулить их скачивание,
      //? Потому что докачать билеты после открытия (перезапуска) приложения мы не можем
      //? По крайней мере, я не могу)
      if (ticket.isDownloading) {
        savedTickets[i] = ticket.copyWith(
          downloadingStatus: DownloadingStatus.notStarted,
          downloadedSize: 0,
        );
      }
      // **********************
      // **********************
      //? Если в базе данных есть билеты, которых нет на устройстве (их могут удалить и тп)
      //? То говорим что они не скачаны
      if (ticket.downloaded &&
          !(await FileUtil.fileIsExists(
            "${ticketsFolder.path}/${ticket.filename}",
          ))) {
        savedTickets[i] = ticket.copyWith(
          downloadingStatus: DownloadingStatus.notStarted,
          downloadedSize: 0,
        );
      }
      // **********************
    }
    _ticketList = savedTickets;
    return List.from(savedTickets);
  }

  List<Ticket> addTicket(String url) {
    //? Добавляем билет, только если его ещё нет в списке
    final ticketInList =
        _ticketList.firstWhereOrNull((ticket) => ticket.url == url);
    if (ticketInList != null) {
      throw AddedTicketError(tikcetName: ticketInList.name);
    }
    final newTicket = Ticket(url: url);
    _ticketList.add(newTicket);
    //? Добавляем билет в БД
    _ticketRepository.saveTicket(newTicket);
    return List.from(_ticketList);
  }

  Future<void> downloadTicket(String url) async {
    log(
      'Start download ticket $url',
      name: 'TicketStorageModel | downloadTicket',
    );
    final ticketIndex = getTicketIndex(url);
    if (ticketIndex == -1) {
      //? На всякий случай проверяем
      //? Если вдруг билет отображается в ui, но его нет в списке модели
      //? Такого быть не должно, но может быть всё xD
      log(
        'Error: ticket not found in ticketList',
        name: 'TicketStorageModel | downloadTicket',
      );
      //! Просто добавялем билет, если его нет, не знаю на сколько это безопасно
      addTicket(url);
      return;
    }
    var ticket = _ticketList[ticketIndex];
    final ticketsFolder = await getTemporaryDirectory();
    final fullPath = "${ticketsFolder.path}/${ticket.filename}";
    if (await FileUtil.fileIsExists(fullPath)) {
      log(
        'Warning: File "${ticket.filename}" is already exists, it will be overwritten',
        name: 'TicketStorageModel | downloadTicket',
      );
    }

    //? Ставим билету DownloadingStatus -> inProgress
    ticket = _changeTicketAndNotify(
      ticket.copyWith(downloadingStatus: DownloadingStatus.inProgress),
      updateInDatabase: true,
    );

    final downloadResult = await _ticketRepository.downloadFile(
      ticket: ticket,
      savePath: fullPath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          //? Обновляем downloadingProgress у билета
          ticket = _changeTicketAndNotify(ticket.copyWith(
            downloadedSize: received,
            totalSize: total,
          ));
        } else {
          log(
            "total = -1",
            name: 'TicketStorageModel | downloadTicket',
          );
        }
      },
    );

    if (downloadResult is FailedDownload) {
      //? Ставим билету DownloadingStatus -> hasError
      ticket = _changeTicketAndNotify(
        ticket.copyWith(downloadingStatus: DownloadingStatus.hasError),
        updateInDatabase: true,
      );
      //? Сообщаем ui об ошибке
      _errorsOnDownloading.add(downloadResult.error);
    } else {
      //? Ставим билету DownloadingStatus -> downloaded, и на всякий случай downloadedSize = totalSize
      //? Потому что иногда downloadedSize бывает больше чем тотал
      ticket = _changeTicketAndNotify(
        ticket.copyWith(
          downloadingStatus: DownloadingStatus.downloaded,
          downloadedSize: ticket.totalSize,
        ),
        updateInDatabase: true,
      );
    }
  }

  Future<void> deleteAllTickets() async {
    await _ticketRepository.deleteAllTickets();
    _ticketList.clear();
    _ticketDataChanged.add(List.from(_ticketList));
  }
}
