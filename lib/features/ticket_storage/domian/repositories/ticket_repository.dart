import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/download_result/download_result.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/database.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/download.dart';

abstract class ITicketRepository {
  Future<List<Ticket>> getTicketsFromDatabase();
  Future<void> saveTicket(Ticket ticket);
  Future<void> updateTicket(Ticket ticket);
  Future<void> deleteTicket(String ticketUrl);
  Future<void> deleteAllTickets();
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
  Future<void> deleteTicket(String ticketUrl) async {
    await DatabaseService.deleteTicket(ticketUrl);
  }

  @override
  Future<void> deleteAllTickets() async {
    await DatabaseService.deleteAllTickets();
  }
}
