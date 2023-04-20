// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sorting_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortingOptions {
  SortingType get type => throw _privateConstructorUsedError;
  bool get reversed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortingOptionsCopyWith<SortingOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortingOptionsCopyWith<$Res> {
  factory $SortingOptionsCopyWith(
          SortingOptions value, $Res Function(SortingOptions) then) =
      _$SortingOptionsCopyWithImpl<$Res, SortingOptions>;
  @useResult
  $Res call({SortingType type, bool reversed});
}

/// @nodoc
class _$SortingOptionsCopyWithImpl<$Res, $Val extends SortingOptions>
    implements $SortingOptionsCopyWith<$Res> {
  _$SortingOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? reversed = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SortingType,
      reversed: null == reversed
          ? _value.reversed
          : reversed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortingOptionsCopyWith<$Res>
    implements $SortingOptionsCopyWith<$Res> {
  factory _$$_SortingOptionsCopyWith(
          _$_SortingOptions value, $Res Function(_$_SortingOptions) then) =
      __$$_SortingOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortingType type, bool reversed});
}

/// @nodoc
class __$$_SortingOptionsCopyWithImpl<$Res>
    extends _$SortingOptionsCopyWithImpl<$Res, _$_SortingOptions>
    implements _$$_SortingOptionsCopyWith<$Res> {
  __$$_SortingOptionsCopyWithImpl(
      _$_SortingOptions _value, $Res Function(_$_SortingOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? reversed = null,
  }) {
    return _then(_$_SortingOptions(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SortingType,
      reversed: null == reversed
          ? _value.reversed
          : reversed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SortingOptions extends _SortingOptions {
  const _$_SortingOptions({required this.type, this.reversed = false})
      : super._();

  @override
  final SortingType type;
  @override
  @JsonKey()
  final bool reversed;

  @override
  String toString() {
    return 'SortingOptions(type: $type, reversed: $reversed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortingOptions &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reversed, reversed) ||
                other.reversed == reversed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, reversed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortingOptionsCopyWith<_$_SortingOptions> get copyWith =>
      __$$_SortingOptionsCopyWithImpl<_$_SortingOptions>(this, _$identity);
}

abstract class _SortingOptions extends SortingOptions {
  const factory _SortingOptions(
      {required final SortingType type,
      final bool reversed}) = _$_SortingOptions;
  const _SortingOptions._() : super._();

  @override
  SortingType get type;
  @override
  bool get reversed;
  @override
  @JsonKey(ignore: true)
  _$$_SortingOptionsCopyWith<_$_SortingOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
