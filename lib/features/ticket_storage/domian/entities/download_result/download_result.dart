import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_result.freezed.dart';

@freezed
class DownloadResult with _$DownloadResult {
  const DownloadResult._();

  const factory DownloadResult.successfullyDownloaded() =
      SuccessfullyDownloaded;

  const factory DownloadResult.canceledByUser() = CanceledByUser;

  const factory DownloadResult.failedDownload({
    required String error,
  }) = FailedDownload;
}
