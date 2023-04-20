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

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
  DateTime get addedDate => throw _privateConstructorUsedError;
  DownloadingStatus get downloadingStatus => throw _privateConstructorUsedError;
  int get totalSize => throw _privateConstructorUsedError;
  int get downloadedSize => throw _privateConstructorUsedError;
  String get savedFileFullPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
          DateTime addedDate,
      DownloadingStatus downloadingStatus,
      int totalSize,
      int downloadedSize,
      String savedFileFullPath});
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
    Object? addedDate = null,
    Object? downloadingStatus = null,
    Object? totalSize = null,
    Object? downloadedSize = null,
    Object? savedFileFullPath = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      addedDate: null == addedDate
          ? _value.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      downloadingStatus: null == downloadingStatus
          ? _value.downloadingStatus
          : downloadingStatus // ignore: cast_nullable_to_non_nullable
              as DownloadingStatus,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      downloadedSize: null == downloadedSize
          ? _value.downloadedSize
          : downloadedSize // ignore: cast_nullable_to_non_nullable
              as int,
      savedFileFullPath: null == savedFileFullPath
          ? _value.savedFileFullPath
          : savedFileFullPath // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
          DateTime addedDate,
      DownloadingStatus downloadingStatus,
      int totalSize,
      int downloadedSize,
      String savedFileFullPath});
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
    Object? addedDate = null,
    Object? downloadingStatus = null,
    Object? totalSize = null,
    Object? downloadedSize = null,
    Object? savedFileFullPath = null,
  }) {
    return _then(_$_Ticket(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      addedDate: null == addedDate
          ? _value.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      downloadingStatus: null == downloadingStatus
          ? _value.downloadingStatus
          : downloadingStatus // ignore: cast_nullable_to_non_nullable
              as DownloadingStatus,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      downloadedSize: null == downloadedSize
          ? _value.downloadedSize
          : downloadedSize // ignore: cast_nullable_to_non_nullable
              as int,
      savedFileFullPath: null == savedFileFullPath
          ? _value.savedFileFullPath
          : savedFileFullPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ticket extends _Ticket {
  const _$_Ticket(
      {required this.url,
      @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
          required this.addedDate,
      this.downloadingStatus = DownloadingStatus.notStarted,
      this.totalSize = 1,
      this.downloadedSize = 0,
      required this.savedFileFullPath})
      : super._();

  factory _$_Ticket.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFromJson(json);

  @override
  final String url;
  @override
  @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
  final DateTime addedDate;
  @override
  @JsonKey()
  final DownloadingStatus downloadingStatus;
  @override
  @JsonKey()
  final int totalSize;
  @override
  @JsonKey()
  final int downloadedSize;
  @override
  final String savedFileFullPath;

  @override
  String toString() {
    return 'Ticket(url: $url, addedDate: $addedDate, downloadingStatus: $downloadingStatus, totalSize: $totalSize, downloadedSize: $downloadedSize, savedFileFullPath: $savedFileFullPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ticket &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate) &&
            (identical(other.downloadingStatus, downloadingStatus) ||
                other.downloadingStatus == downloadingStatus) &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.downloadedSize, downloadedSize) ||
                other.downloadedSize == downloadedSize) &&
            (identical(other.savedFileFullPath, savedFileFullPath) ||
                other.savedFileFullPath == savedFileFullPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, addedDate,
      downloadingStatus, totalSize, downloadedSize, savedFileFullPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(
      this,
    );
  }
}

abstract class _Ticket extends Ticket {
  const factory _Ticket(
      {required final String url,
      @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
          required final DateTime addedDate,
      final DownloadingStatus downloadingStatus,
      final int totalSize,
      final int downloadedSize,
      required final String savedFileFullPath}) = _$_Ticket;
  const _Ticket._() : super._();

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$_Ticket.fromJson;

  @override
  String get url;
  @override
  @JsonKey(toJson: DateUtil.dateToString, fromJson: DateUtil.dateFromString)
  DateTime get addedDate;
  @override
  DownloadingStatus get downloadingStatus;
  @override
  int get totalSize;
  @override
  int get downloadedSize;
  @override
  String get savedFileFullPath;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
