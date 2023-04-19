import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/errors/added_ticket_error.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:collection/collection.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/repositories/ticket_repository.dart';
import 'package:surf_flutter_study_jam_2023/utils/delays.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';

class TicketStorageModel extends ElementaryModel {
  /// Ticket repository
  final ITicketRepository _ticketRepository;

  /// Ticket list
  List<Ticket> _ticketList = [];

  /// Cancel tokens for cancel downloading
  Map<String, CancelToken> _cancelTokens = {};

  /// Stream to notify the wm about changes in tickets
  final StreamController<List<Ticket>> _ticketDataChanged =
      StreamController.broadcast();

  /// Stream to notify the wm about donwloading errors
  final StreamController<String> _errorsOnDownloading =
      StreamController.broadcast();

  TicketStorageModel({
    required ITicketRepository ticketRepository,
  }) : _ticketRepository = ticketRepository;

  ///* --------- GETTERS ----------------

  Stream<List<Ticket>> get ticketDataChanged => _ticketDataChanged.stream;
  Stream<String> get errorsOnDownloading => _errorsOnDownloading.stream;

  //? Всегда отдаём новый (скопированный) лист, чтобы список в модели и список в виджет-модели не ссылались на одно и то же
  List<Ticket> get ticketList => List.from(_ticketList);

  ///* ----------------------------------

  ///* -------- Internal Functions -------

  int getTicketIndex(String ticketUrl) {
    return _ticketList.indexWhere((ticket) => ticket.url == ticketUrl);
  }

  ///? После инициализации все изменения данных какого-то билета происходят только через эту функцию
  ///? Потому что индекс каждого билета может изменится в любой момент (при удалении каких-то билетов)
  ///? Для каждого изменения нам нужно получать корректный индекс билета в списке
  Future<Ticket> _changeTicketAndNotify(
    Ticket newTicketData, {
    bool updateInDatabase = false,
  }) async {
    final ticketIndex = getTicketIndex(newTicketData.url);

    ///? Меняем данные в списке модели
    _ticketList[ticketIndex] = newTicketData;

    ///? Уведомляем wm
    _ticketDataChanged.add(List.from(_ticketList));

    ///? Обновляем данные в БД
    if (updateInDatabase) {
      await _ticketRepository.updateTicket(newTicketData);
    }
    return newTicketData;
  }

  //* ----------------------------------

  Future<List<Ticket>> initialize() async {
    //? Создаём папку для билетов, если её ещё нет
    await _ticketRepository.createTicketsDirIfNotExists();

    //? Читаем билеты из бд
    var savedTickets = await _ticketRepository.getTicketsFromDatabase();
    for (var i = 0; i < savedTickets.length; i++) {
      var ticket = savedTickets[i];

      ///? Если в базе данных есть недокачанные билеты, обнулить их скачивание,
      ///? Потому что докачать билеты после открытия (перезапуска) приложения мы не можем
      ///? По крайней мере, я не могу)
      if (ticket.isDownloading) {
        ///? Сбрасываем прогресс загрузки
        ticket = ticket.copyWith(
          downloadingStatus: DownloadingStatus.notStarted,
          downloadedSize: 0,
        );
        log(
          '',
          error:
              'Found ticket with incomplete download "${ticket.name}", its download progress will be reset',
          name: 'Ticket Storage Model | initialize',
        );
        savedTickets[i] = ticket;

        ///? Удаляем файл билета
        _ticketRepository.deleteTicketFile(ticket);

        ///? Обновляем в бд
        _ticketRepository.updateTicket(ticket);
      }

      ///? Если в базе данных есть билеты, которых нет на устройстве (их могут удалить и тп)
      ///? То говорим что они не скачаны
      if (ticket.downloaded &&
          !(await _ticketRepository.ticketFileIsExists(ticket))) {
        ///? Сбрасываем прогресс загрузки
        ticket = ticket.copyWith(
          downloadingStatus: DownloadingStatus.notStarted,
          downloadedSize: 0,
        );
        log(
          '',
          error:
              'Downloaded ticket was found, but its file was not found "${ticket.name}", its download progress will be reset',
          name: 'Ticket Storage Model | initialize',
        );
        savedTickets[i] = ticket;

        ///? Удаляем файл билета
        _ticketRepository.deleteTicketFile(ticket);

        ///? Обновляем в бд
        _ticketRepository.updateTicket(ticket);
      }
    }
    _ticketList = savedTickets;
    _cancelTokens = Map.fromIterable(
      savedTickets,
      key: (ticket) => ticket.url,
      value: (_) => CancelToken(),
    );

    ///? Фейковая задержка для отладки отображения чтения из бд
    await DelayUtil.fakeDelay();
    return List.from(savedTickets);
  }

  Future<List<Ticket>> addTicket(String url) async {
    ///? Добавляем билет, только если его ещё нет в списке
    final ticketInList =
        _ticketList.firstWhereOrNull((ticket) => ticket.url == url);
    if (ticketInList != null) {
      throw AddedTicketError(tikcetName: ticketInList.name);
    }

    final newTicket = Ticket(
      url: url,
      savedFileFullPath:
          '${await _ticketRepository.ticketsDirPath}/${UriUtil.getFilenameFromUri(url)}',
    );

    ///? Добавляем билет в список модели
    _ticketList.add(newTicket);

    ///? Добавляем дио токен в модель
    _cancelTokens[url] = CancelToken();

    ///? Добавляем билет в БД
    _ticketRepository.saveTicket(newTicket);

    ///? Попытаемся узнать размер файла
    ///! Новый билет сразу отдаём wm, не дожидаясь размера файла
    _ticketRepository.getTicketSizeByUrl(url).then((size) {
      if (size == null) {
        log(
          '',
          error: 'Unable to get filesize of ticket "${newTicket.name}"',
          name: 'Ticket Storage Model | addTicket',
        );
        return;
      }
      _changeTicketAndNotify(newTicket.copyWith(totalSize: size));
    });

    return List.from(_ticketList);
  }

  Future<void> downloadTicket(String url) async {
    log(
      'Start download ticket $url',
      name: 'TicketStorageModel | downloadTicket',
    );
    final ticketIndex = getTicketIndex(url);
    if (ticketIndex == -1) {
      ///? На всякий случай проверяем
      ///? Если вдруг билет отображается в wm, но его нет в списке модели
      ///? Такого быть не должно, но может быть всё xD
      log(
        'Error: ticket not found in ticketList',
        name: 'TicketStorageModel | downloadTicket',
      );
      //! Просто добавялем билет, если его нет, не знаю на сколько это безопасно
      addTicket(url);
      return;
    }
    var ticket = _ticketList[ticketIndex];

    ///? Проверки
    if (ticket.isDownloading) {
      _errorsOnDownloading.add('Билет "${ticket.name}" уже скачивается');
      return;
    }
    if (ticket.downloaded) {
      _errorsOnDownloading.add('Билет "${ticket.name}" уже скачен');
      return;
    }

    ///? Ставим билету DownloadingStatus -> inProgress
    ticket = await _changeTicketAndNotify(
      ticket.copyWith(downloadingStatus: DownloadingStatus.inProgress),
      updateInDatabase: true,
    );

    ///? Скачиваем файл
    final downloadResult = await _ticketRepository.downloadTicketFile(
      ticket: ticket,
      cancelToken: _cancelTokens[url],
      onReceiveProgress: (received, total) async {
        if (total != -1) {
          ///? Обновляем downloadingProgress у билета
          ticket = await _changeTicketAndNotify(ticket.copyWith(
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

    downloadResult.when(
      successfullyDownloaded: () async {
        ///? Ставим билету DownloadingStatus -> downloaded, и на всякий случай downloadedSize = totalSize
        ///? Потому что иногда downloadedSize бывает больше чем тотал
        ticket = await _changeTicketAndNotify(
          ticket.copyWith(
            downloadingStatus: DownloadingStatus.downloaded,
            downloadedSize: ticket.totalSize,
          ),
          updateInDatabase: true,
        );
      },
      canceledByUser: () async {
        ///? Сбрасываем прогресс скачивание в данных билета
        final ticketIndex = getTicketIndex(url);

        ///? Билета может уже не быть в списке, если мы его удалили во время скачивания
        if (ticketIndex == -1) return;
        final ticket = _ticketList[ticketIndex];
        await _changeTicketAndNotify(
          ticket.copyWith(
            downloadedSize: 0,
            downloadingStatus: DownloadingStatus.canceledByUser,
          ),
          updateInDatabase: true,
        );

        ///? Удаляем недокачанный файл билета, если он там конечно есть
        _ticketRepository.deleteTicketFile(ticket);

        ///? Пересоздаём токен, ибо нельзя скачать файл с отменненым токеном
        _cancelTokens[url] = CancelToken();
      },
      failedDownload: (String error) async {
        ///? Ставим билету DownloadingStatus -> hasError
        ticket = await _changeTicketAndNotify(
          ticket.copyWith(downloadingStatus: DownloadingStatus.hasError),
          updateInDatabase: true,
        );

        ///? Сообщаем wm об ошибке
        _errorsOnDownloading.add(error);

        ///? Удаляем файл билета
        _ticketRepository.deleteTicketFile(ticket);
      },
    );
  }

  Future<void> cancelDownloading(String ticketUrl) async {
    ///? Защита от дурака(меня)
    ///? Если для этого билета нет токена, то ничего не делаем
    if (_cancelTokens[ticketUrl] == null) return;

    ///? Отменяем скачивание
    _cancelTokens[ticketUrl]!.cancel();
  }

  Future<void> downloadAllTickets() async {
    //? Вызываем функцию downloadTicket для всех билетов, у которых доступно скачивание
    await Future.wait(
      _ticketList
          .where(
            (ticket) => ticket.canDownload,
          )
          .map(
            (ticket) => downloadTicket(ticket.url),
          ),
    );
  }

  Future<void> deleteAllTickets() async {
    ///? Удаляем в тикеты в бд и файлы на устройстве
    await _ticketRepository.deleteAllTickets();

    ///? Отчищаем в модели
    _ticketList.clear();

    ///? Кидаем в виджет модель
    _ticketDataChanged.add(List.from(_ticketList));
  }

  Future<void> deleteTicket(Ticket ticket) async {
    ///? Если билет скачивается, отменяем скачивание
    if (ticket.isDownloading) {
      cancelDownloading(ticket.url);
    }

    ///? Удаляем билет из бд и его файл с устройства
    _ticketRepository.deleteTicket(ticket);

    ///? Удаляем билет из списка модели
    _ticketList.removeWhere((savedTicket) => savedTicket.url == ticket.url);

    ///? Удаляем cancel token билета
    _cancelTokens.remove(ticket.url);

    ///? Уведомляем wm об изменениях
    _ticketDataChanged.add(List.from(_ticketList));
  }

  Future<void> deleteTicketFile(Ticket ticket) async {
    ///? Удаляем файл билета с устройства
    _ticketRepository.deleteTicketFile(ticket);

    ///? Изменяем данные билета в модели, базе данных и увемоляем wm об этом
    ticket = await _changeTicketAndNotify(
      ticket.copyWith(
        downloadedSize: 0,
        downloadingStatus: DownloadingStatus.notStarted,
      ),
      updateInDatabase: true,
    );
  }

  Future<void> redownloadTicketFile(Ticket ticket) async {
    ///? Удаляем файл билета с устройства
    _ticketRepository.deleteTicketFile(ticket);

    ///? Изменяем данные билета в модели, базе данных и увемоляем wm об этом
    ticket = await _changeTicketAndNotify(
      ticket.copyWith(
        downloadedSize: 0,
        downloadingStatus: DownloadingStatus.notStarted,
      ),
      updateInDatabase: true,
    );

    ///? Запускаем скачивание билета
    downloadTicket(ticket.url);
  }
}
