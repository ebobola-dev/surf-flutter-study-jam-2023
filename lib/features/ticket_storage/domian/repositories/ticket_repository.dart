import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/download_result/download_result.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/download.dart';

abstract class ITicketRepository {
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
}
