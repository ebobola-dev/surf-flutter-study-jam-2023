import 'package:freezed_annotation/freezed_annotation.dart';

enum DownloadingStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('downloaded')
  downloaded,
  @JsonValue('has_error')
  hasError,
}
