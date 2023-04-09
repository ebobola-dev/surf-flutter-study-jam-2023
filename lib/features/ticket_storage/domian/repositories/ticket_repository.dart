import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/download.dart';

abstract class ITicketRepository {
  Future<void> downloadFile({
    required String url,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
  });
}

class TicketRepository implements ITicketRepository {
  final DownloadService _downloadService;
  TicketRepository(this._downloadService);

  @override
  Future<void> downloadFile({
    required String url,
    required String savePath,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    await _downloadService.downloadFile(
      url: url,
      savePath: savePath,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
