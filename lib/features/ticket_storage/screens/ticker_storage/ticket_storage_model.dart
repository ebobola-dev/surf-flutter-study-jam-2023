import 'dart:async';
import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/errors/added_ticket_error.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:collection/collection.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/repositories/ticket_repository.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';

class TicketStorageModel extends ElementaryModel {
  final ITicketRepository _ticketRepository;
  final List<Ticket> _ticketList = [];
  final StreamController<List<Ticket>> _ticketDataChanged =
      StreamController.broadcast();

  TicketStorageModel({
    required ITicketRepository ticketRepository,
  }) : _ticketRepository = ticketRepository;

  //* --------- GETTERS ----------------

  Stream<List<Ticket>> get ticketDataChanged => _ticketDataChanged.stream;

  //? Геттер возращает новый (скопированный) лист, чтобы список в модели и список в виджет-модели не ссылались на одно и то же
  List<Ticket> get ticketList => List.from(_ticketList);

  //* ----------------------------------

  //* -------- Inherit Functions -------

  int getTicketIndex(String ticketUrl) {
    return _ticketList.indexWhere((ticket) => ticket.url == ticketUrl);
  }

  //* ----------------------------------

  List<Ticket> addTicket(String url) {
    //? Добавляем билет, только если его ещё нет в списке
    final ticketInList =
        _ticketList.firstWhereOrNull((ticket) => ticket.url == url);
    if (ticketInList != null) {
      throw AddedTicketError(tikcetName: ticketInList.name);
    }
    _ticketList.add(Ticket(url: url));
    //? Опять же, возращаем скопированный список
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
      //TODO handle error
      return;
    }
    var ticket = _ticketList[ticketIndex];
    final tempDirectory = await getTemporaryDirectory();
    final fullPath = "${tempDirectory.path}/${ticket.filename}'";
    if (await FileUtil.fileIsExists(fullPath)) {
      log(
        'Warning: File "${ticket.filename}" is already exists, it will be overwritten',
        name: 'TicketStorageModel | downloadTicket',
      );
      //TODO report to UI
    }

    //? Ставим билету downloadStarted [true] и говорим ui об изменениях в списке билетов
    ticket = ticket.copyWith(downloadStarted: true);
    _ticketList[ticketIndex] = ticket;
    _ticketDataChanged.add(List.from(_ticketList));

    await _ticketRepository.downloadFile(
      url: url,
      savePath: fullPath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          //? Обновляем downloadingProgress у билета и говорим ui об изменениях в списке билетов
          ticket = ticket.copyWith(
            downloadingProgress: (received / total * 100).round(),
          );
          _ticketList[ticketIndex] = ticket;
          _ticketDataChanged.add(List.from(_ticketList));
          log('total $total');
        } else {
          log(
            "total = -1",
            name: 'TicketStorageModel | downloadTicket',
          );
        }
      },
    );
    //? Ставим билету downloaded [true] и говорим ui об изменениях в списке билетов
    ticket = ticket.copyWith(downloaded: true);
    _ticketList[ticketIndex] = ticket;
    _ticketDataChanged.add(List.from(_ticketList));
  }
}
