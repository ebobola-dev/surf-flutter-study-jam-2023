import 'package:freezed_annotation/freezed_annotation.dart';

enum DownloadingStatus {
  @JsonValue('notStarted')
  notStarted,
  @JsonValue('inProgress')
  inProgress,
  @JsonValue('downloaded')
  downloaded,
  @JsonValue('hasError')
  hasError,
}

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'downloading_status.freezed.dart';
// part 'downloading_status.g.dart';

// @freezed
// class DownloadingStatus with _$DownloadingStatus {
//   const DownloadingStatus._();

//   const factory DownloadingStatus.notStarted() = NotStarted;
//   const factory DownloadingStatus.inProgress() = InProgress;
//   const factory DownloadingStatus.downloaded() = Downloaded;
//   const factory DownloadingStatus.hasError() = HasError;

//   factory DownloadingStatus.fromJson(Map<String, dynamic> json) =>
//       _$DownloadingStatusFromJson(json);
// }
