import 'package:path_provider/path_provider.dart';
import 'package:surf_flutter_study_jam_2023/config/config.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/download_result/download_result.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/database.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/download.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';

abstract class ITicketRepository {
  Future<String> get ticketsDirPath;
  Future<List<Ticket>> getTicketsFromDatabase();
  Future<void> createTicketsDirIfNotExists();
  Future<void> saveTicket(Ticket ticket);
  Future<void> updateTicket(Ticket ticket);
  Future<void> deleteTicket(Ticket ticket);
  Future<void> deleteAllTickets();
  Future<void> deleteTicketFile(Ticket ticket);
  Future<DownloadResult> downloadFile({
    required Ticket ticket,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
  });
}

class TicketRepository implements ITicketRepository {
  final DownloadService _downloadService;
  TicketRepository(this._downloadService);

  @override
  Future<String> get ticketsDirPath async {
    final temproraryFolder = await getTemporaryDirectory();
    return "${temproraryFolder.path}/${Config.ticketSavingFolder}";
  }

  @override
  Future<void> createTicketsDirIfNotExists() async {
    if (!(await FileUtil.dirIsExists(await ticketsDirPath))) {
      await FileUtil.createFolderInTemporaryDir(Config.ticketSavingFolder);
    }
  }

  @override
  Future<DownloadResult> downloadFile({
    required Ticket ticket,
    required String savePath,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    if (await _downloadService.downloadFile(
      url: ticket.url,
      savePath: savePath,
      onReceiveProgress: onReceiveProgress,
    )) {
      return const SuccessfullyDownloaded();
    } else {
      return FailedDownload(
        error:
            'При скачивании билета "${ticket.name} произошла какая-то ошибка"',
      );
    }
  }

  @override
  Future<List<Ticket>> getTicketsFromDatabase() async {
    return await DatabaseService.getAllTickets();
  }

  @override
  Future<void> saveTicket(Ticket ticket) async {
    await DatabaseService.saveTicket(ticket);
  }

  @override
  Future<void> updateTicket(Ticket ticket) async {
    await DatabaseService.updateTicket(ticket);
  }

  @override
  Future<void> deleteTicket(Ticket ticket) async {
    //? Удаляем в бд
    await DatabaseService.deleteTicket(ticket.url);
    //? Удаляем файл
    await FileUtil.deleteFile('${await ticketsDirPath}/${ticket.filename}');
  }

  @override
  Future<void> deleteAllTickets() async {
    //? Удаляем в бд
    await DatabaseService.deleteAllTickets();
    //? Удаляем файлы
    await FileUtil.clearDirectory(await ticketsDirPath);
  }

  @override
  Future<void> deleteTicketFile(Ticket ticket) async {
    await FileUtil.deleteFile('${await ticketsDirPath}/${ticket.filename}');
  }
}
