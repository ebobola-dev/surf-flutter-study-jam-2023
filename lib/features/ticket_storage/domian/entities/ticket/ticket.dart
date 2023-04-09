import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';

part 'ticket.freezed.dart';

@freezed
class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required String url,
    @Default(false) bool downloadStarted,
    @Default(false) bool downloaded,
    @Default(1) int totalSize,
    @Default(0) int downloadedSize,
    @Default(false) bool errorOnDownloading,
  }) = _Ticket;

  String get name => FileUtil.getFilenameWithoutExt(url);
  String get filename => UriUtil.getFilenameFromUri(url);
  int get downloadingProgress => (downloadedSize / totalSize * 100).round();
}
