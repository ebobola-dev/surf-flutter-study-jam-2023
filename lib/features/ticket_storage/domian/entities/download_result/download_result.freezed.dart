// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() successfullyDownloaded,
    required TResult Function() canceledByUser,
    required TResult Function(String error) failedDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? successfullyDownloaded,
    TResult? Function()? canceledByUser,
    TResult? Function(String error)? failedDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? successfullyDownloaded,
    TResult Function()? canceledByUser,
    TResult Function(String error)? failedDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfullyDownloaded value)
        successfullyDownloaded,
    required TResult Function(CanceledByUser value) canceledByUser,
    required TResult Function(FailedDownload value) failedDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult? Function(CanceledByUser value)? canceledByUser,
    TResult? Function(FailedDownload value)? failedDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult Function(CanceledByUser value)? canceledByUser,
    TResult Function(FailedDownload value)? failedDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadResultCopyWith<$Res> {
  factory $DownloadResultCopyWith(
          DownloadResult value, $Res Function(DownloadResult) then) =
      _$DownloadResultCopyWithImpl<$Res, DownloadResult>;
}

/// @nodoc
class _$DownloadResultCopyWithImpl<$Res, $Val extends DownloadResult>
    implements $DownloadResultCopyWith<$Res> {
  _$DownloadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessfullyDownloadedCopyWith<$Res> {
  factory _$$SuccessfullyDownloadedCopyWith(_$SuccessfullyDownloaded value,
          $Res Function(_$SuccessfullyDownloaded) then) =
      __$$SuccessfullyDownloadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessfullyDownloadedCopyWithImpl<$Res>
    extends _$DownloadResultCopyWithImpl<$Res, _$SuccessfullyDownloaded>
    implements _$$SuccessfullyDownloadedCopyWith<$Res> {
  __$$SuccessfullyDownloadedCopyWithImpl(_$SuccessfullyDownloaded _value,
      $Res Function(_$SuccessfullyDownloaded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessfullyDownloaded extends SuccessfullyDownloaded {
  const _$SuccessfullyDownloaded() : super._();

  @override
  String toString() {
    return 'DownloadResult.successfullyDownloaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessfullyDownloaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() successfullyDownloaded,
    required TResult Function() canceledByUser,
    required TResult Function(String error) failedDownload,
  }) {
    return successfullyDownloaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? successfullyDownloaded,
    TResult? Function()? canceledByUser,
    TResult? Function(String error)? failedDownload,
  }) {
    return successfullyDownloaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? successfullyDownloaded,
    TResult Function()? canceledByUser,
    TResult Function(String error)? failedDownload,
    required TResult orElse(),
  }) {
    if (successfullyDownloaded != null) {
      return successfullyDownloaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfullyDownloaded value)
        successfullyDownloaded,
    required TResult Function(CanceledByUser value) canceledByUser,
    required TResult Function(FailedDownload value) failedDownload,
  }) {
    return successfullyDownloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult? Function(CanceledByUser value)? canceledByUser,
    TResult? Function(FailedDownload value)? failedDownload,
  }) {
    return successfullyDownloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult Function(CanceledByUser value)? canceledByUser,
    TResult Function(FailedDownload value)? failedDownload,
    required TResult orElse(),
  }) {
    if (successfullyDownloaded != null) {
      return successfullyDownloaded(this);
    }
    return orElse();
  }
}

abstract class SuccessfullyDownloaded extends DownloadResult {
  const factory SuccessfullyDownloaded() = _$SuccessfullyDownloaded;
  const SuccessfullyDownloaded._() : super._();
}

/// @nodoc
abstract class _$$CanceledByUserCopyWith<$Res> {
  factory _$$CanceledByUserCopyWith(
          _$CanceledByUser value, $Res Function(_$CanceledByUser) then) =
      __$$CanceledByUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CanceledByUserCopyWithImpl<$Res>
    extends _$DownloadResultCopyWithImpl<$Res, _$CanceledByUser>
    implements _$$CanceledByUserCopyWith<$Res> {
  __$$CanceledByUserCopyWithImpl(
      _$CanceledByUser _value, $Res Function(_$CanceledByUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CanceledByUser extends CanceledByUser {
  const _$CanceledByUser() : super._();

  @override
  String toString() {
    return 'DownloadResult.canceledByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CanceledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() successfullyDownloaded,
    required TResult Function() canceledByUser,
    required TResult Function(String error) failedDownload,
  }) {
    return canceledByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? successfullyDownloaded,
    TResult? Function()? canceledByUser,
    TResult? Function(String error)? failedDownload,
  }) {
    return canceledByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? successfullyDownloaded,
    TResult Function()? canceledByUser,
    TResult Function(String error)? failedDownload,
    required TResult orElse(),
  }) {
    if (canceledByUser != null) {
      return canceledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfullyDownloaded value)
        successfullyDownloaded,
    required TResult Function(CanceledByUser value) canceledByUser,
    required TResult Function(FailedDownload value) failedDownload,
  }) {
    return canceledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult? Function(CanceledByUser value)? canceledByUser,
    TResult? Function(FailedDownload value)? failedDownload,
  }) {
    return canceledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult Function(CanceledByUser value)? canceledByUser,
    TResult Function(FailedDownload value)? failedDownload,
    required TResult orElse(),
  }) {
    if (canceledByUser != null) {
      return canceledByUser(this);
    }
    return orElse();
  }
}

abstract class CanceledByUser extends DownloadResult {
  const factory CanceledByUser() = _$CanceledByUser;
  const CanceledByUser._() : super._();
}

/// @nodoc
abstract class _$$FailedDownloadCopyWith<$Res> {
  factory _$$FailedDownloadCopyWith(
          _$FailedDownload value, $Res Function(_$FailedDownload) then) =
      __$$FailedDownloadCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailedDownloadCopyWithImpl<$Res>
    extends _$DownloadResultCopyWithImpl<$Res, _$FailedDownload>
    implements _$$FailedDownloadCopyWith<$Res> {
  __$$FailedDownloadCopyWithImpl(
      _$FailedDownload _value, $Res Function(_$FailedDownload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailedDownload(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedDownload extends FailedDownload {
  const _$FailedDownload({required this.error}) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'DownloadResult.failedDownload(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedDownload &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedDownloadCopyWith<_$FailedDownload> get copyWith =>
      __$$FailedDownloadCopyWithImpl<_$FailedDownload>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() successfullyDownloaded,
    required TResult Function() canceledByUser,
    required TResult Function(String error) failedDownload,
  }) {
    return failedDownload(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? successfullyDownloaded,
    TResult? Function()? canceledByUser,
    TResult? Function(String error)? failedDownload,
  }) {
    return failedDownload?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? successfullyDownloaded,
    TResult Function()? canceledByUser,
    TResult Function(String error)? failedDownload,
    required TResult orElse(),
  }) {
    if (failedDownload != null) {
      return failedDownload(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfullyDownloaded value)
        successfullyDownloaded,
    required TResult Function(CanceledByUser value) canceledByUser,
    required TResult Function(FailedDownload value) failedDownload,
  }) {
    return failedDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult? Function(CanceledByUser value)? canceledByUser,
    TResult? Function(FailedDownload value)? failedDownload,
  }) {
    return failedDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfullyDownloaded value)? successfullyDownloaded,
    TResult Function(CanceledByUser value)? canceledByUser,
    TResult Function(FailedDownload value)? failedDownload,
    required TResult orElse(),
  }) {
    if (failedDownload != null) {
      return failedDownload(this);
    }
    return orElse();
  }
}

abstract class FailedDownload extends DownloadResult {
  const factory FailedDownload({required final String error}) =
      _$FailedDownload;
  const FailedDownload._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$FailedDownloadCopyWith<_$FailedDownload> get copyWith =>
      throw _privateConstructorUsedError;
}
