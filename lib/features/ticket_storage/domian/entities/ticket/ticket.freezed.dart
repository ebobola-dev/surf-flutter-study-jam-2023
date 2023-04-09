// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Ticket {
  String get url => throw _privateConstructorUsedError;
  bool get downloadStarted => throw _privateConstructorUsedError;
  bool get downloaded => throw _privateConstructorUsedError;
  int get downloadingProgress => throw _privateConstructorUsedError;
  bool get downloadingError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String url,
      bool downloadStarted,
      bool downloaded,
      int downloadingProgress,
      bool downloadingError});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? downloadStarted = null,
    Object? downloaded = null,
    Object? downloadingProgress = null,
    Object? downloadingError = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      downloadStarted: null == downloadStarted
          ? _value.downloadStarted
          : downloadStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      downloaded: null == downloaded
          ? _value.downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadingProgress: null == downloadingProgress
          ? _value.downloadingProgress
          : downloadingProgress // ignore: cast_nullable_to_non_nullable
              as int,
      downloadingError: null == downloadingError
          ? _value.downloadingError
          : downloadingError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$_TicketCopyWith(_$_Ticket value, $Res Function(_$_Ticket) then) =
      __$$_TicketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      bool downloadStarted,
      bool downloaded,
      int downloadingProgress,
      bool downloadingError});
}

/// @nodoc
class __$$_TicketCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$_Ticket>
    implements _$$_TicketCopyWith<$Res> {
  __$$_TicketCopyWithImpl(_$_Ticket _value, $Res Function(_$_Ticket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? downloadStarted = null,
    Object? downloaded = null,
    Object? downloadingProgress = null,
    Object? downloadingError = null,
  }) {
    return _then(_$_Ticket(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      downloadStarted: null == downloadStarted
          ? _value.downloadStarted
          : downloadStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      downloaded: null == downloaded
          ? _value.downloaded
          : downloaded // ignore: cast_nullable_to_non_nullable
              as bool,
      downloadingProgress: null == downloadingProgress
          ? _value.downloadingProgress
          : downloadingProgress // ignore: cast_nullable_to_non_nullable
              as int,
      downloadingError: null == downloadingError
          ? _value.downloadingError
          : downloadingError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Ticket extends _Ticket {
  const _$_Ticket(
      {required this.url,
      this.downloadStarted = false,
      this.downloaded = false,
      this.downloadingProgress = 0,
      this.downloadingError = false})
      : super._();

  @override
  final String url;
  @override
  @JsonKey()
  final bool downloadStarted;
  @override
  @JsonKey()
  final bool downloaded;
  @override
  @JsonKey()
  final int downloadingProgress;
  @override
  @JsonKey()
  final bool downloadingError;

  @override
  String toString() {
    return 'Ticket(url: $url, downloadStarted: $downloadStarted, downloaded: $downloaded, downloadingProgress: $downloadingProgress, downloadingError: $downloadingError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ticket &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.downloadStarted, downloadStarted) ||
                other.downloadStarted == downloadStarted) &&
            (identical(other.downloaded, downloaded) ||
                other.downloaded == downloaded) &&
            (identical(other.downloadingProgress, downloadingProgress) ||
                other.downloadingProgress == downloadingProgress) &&
            (identical(other.downloadingError, downloadingError) ||
                other.downloadingError == downloadingError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, downloadStarted, downloaded,
      downloadingProgress, downloadingError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);
}

abstract class _Ticket extends Ticket {
  const factory _Ticket(
      {required final String url,
      final bool downloadStarted,
      final bool downloaded,
      final int downloadingProgress,
      final bool downloadingError}) = _$_Ticket;
  const _Ticket._() : super._();

  @override
  String get url;
  @override
  bool get downloadStarted;
  @override
  bool get downloaded;
  @override
  int get downloadingProgress;
  @override
  bool get downloadingError;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
