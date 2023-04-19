import 'package:freezed_annotation/freezed_annotation.dart';

enum DownloadingStatus {
  /// Скачивание не начато
  @JsonValue('not_started')
  notStarted,

  /// Скачивание в процессе
  @JsonValue('in_progress')
  inProgress,

  /// Успешно скачано
  @JsonValue('downloaded')
  downloaded,

  /// Скачивание отменено пользователем
  @JsonValue('canceled_by_user')
  canceledByUser,

  /// При скачивании возникла ошибка
  @JsonValue('has_error')
  hasError;

  ///? Можем начать скачивание, только если оно ещё не начато и не завершено
  bool get canDownload => ![
        DownloadingStatus.inProgress,
        DownloadingStatus.downloaded,
      ].contains(this);
}
