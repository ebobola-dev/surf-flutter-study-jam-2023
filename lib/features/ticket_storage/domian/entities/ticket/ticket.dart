import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/extensions.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

bool booleanFromInt(int value) => value.toBoolean();

int booleanToInt(bool value) => value.toInt();

@freezed
class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required String url,
    @Default(false)
    @JsonKey(fromJson: booleanFromInt, toJson: booleanToInt)
        bool downloadStarted,
    @Default(false)
    @JsonKey(fromJson: booleanFromInt, toJson: booleanToInt)
        bool downloaded,
    @Default(1) int totalSize,
    @Default(0) int downloadedSize,
    @Default(false)
    @JsonKey(fromJson: booleanFromInt, toJson: booleanToInt)
        bool errorOnDownloading,
  }) = _Ticket;

  String get name => FileUtil.getFilenameWithoutExt(url);
  String get filename => UriUtil.getFilenameFromUri(url);
  int get downloadingProgress => (downloadedSize / totalSize * 100).round();

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
