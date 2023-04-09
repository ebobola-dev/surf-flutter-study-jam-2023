import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/utils/uri_util.dart';

part 'ticket.freezed.dart';

@freezed
class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    required String url,
    @Default(false) bool downloadStarted,
    @Default(false) bool downloaded,
  }) = _Ticket;

  String get filename => UriUtil.getFilenameFromUri(url);
}
