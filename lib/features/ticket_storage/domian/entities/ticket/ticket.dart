import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
import 'package:surf_flutter_study_jam_2023/utils/date_utils.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required String url,
    @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
        required DateTime addedDate,
    @Default(DownloadingStatus.notStarted) DownloadingStatus downloadingStatus,
    @Default(1) int totalSize,
    @Default(0) int downloadedSize,
    required String savedFileFullPath,
  }) = _Ticket;

  /// Имя файла такое же как в ссылке
  String get filename => UriUtil.getFilenameFromUri(url);

  /// Имя берется из ссылки без расширения
  String get name => FileUtil.getFilenameWithoutExt(url);

  /// Прогресс скачивания в процентах
  int get downloadingProgress => (downloadedSize / totalSize * 100).round();

  /// Можем ли мы начать скачивание этого билета
  bool get canDownload => downloadingStatus.canDownload;

  /// Билет скачивается
  bool get isDownloading => downloadingStatus == DownloadingStatus.inProgress;

  /// Билет скачан успешно
  bool get downloaded => downloadingStatus == DownloadingStatus.downloaded;

  /// При скачивании билета произошла ошибка
  bool get hasDownloadingError =>
      downloadingStatus == DownloadingStatus.hasError;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
