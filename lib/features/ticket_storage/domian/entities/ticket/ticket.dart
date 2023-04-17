import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required String url,
    @Default(DownloadingStatus.notStarted) DownloadingStatus downloadingStatus,
    @Default(1) int totalSize,
    @Default(0) int downloadedSize,
  }) = _Ticket;

  String get name => FileUtil.getFilenameWithoutExt(url);
  String get filename => UriUtil.getFilenameFromUri(url);
  //- not used yet
  int get downloadingProgress => (downloadedSize / totalSize * 100).round();
  //? Можем скачать билет, только если его скачивание ещё не начато, или оно завершилось ошибкой
  bool get canDownload => [
        DownloadingStatus.notStarted,
        DownloadingStatus.hasError
      ].contains(downloadingStatus);
  bool get isDownloading => downloadingStatus == DownloadingStatus.inProgress;
  bool get downloaded => downloadingStatus == DownloadingStatus.downloaded;
  bool get hasDownloadingError =>
      downloadingStatus == DownloadingStatus.hasError;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
