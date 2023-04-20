import 'package:freezed_annotation/freezed_annotation.dart';

enum DownloadingStatus {
  /// Скачивание не начато
  @JsonValue('not_started')
  notStarted(0),

  /// Скачивание в процессе
  @JsonValue('in_progress')
  inProgress(1),

  /// Успешно скачано
  @JsonValue('downloaded')
  downloaded(2),

  /// Скачивание отменено пользователем
  @JsonValue('canceled_by_user')
  canceledByUser(0),

  /// При скачивании возникла ошибка
  @JsonValue('has_error')
  hasError(0);

  final int sortingIndex;
  const DownloadingStatus(this.sortingIndex);

  ///? Можем начать скачивание, только если оно ещё не начато и не завершено
  bool get canDownload => ![
        DownloadingStatus.inProgress,
        DownloadingStatus.downloaded,
      ].contains(this);
}
