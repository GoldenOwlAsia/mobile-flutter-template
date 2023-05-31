// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_online.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChatOnline _$MChatOnlineFromJson(Map<String, dynamic> json) {
  return _MChatOnline.fromJson(json);
}

/// @nodoc
mixin _$MChatOnline {
  String get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get onlineAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get offlineAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChatOnlineCopyWith<MChatOnline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChatOnlineCopyWith<$Res> {
  factory $MChatOnlineCopyWith(
          MChatOnline value, $Res Function(MChatOnline) then) =
      _$MChatOnlineCopyWithImpl<$Res, MChatOnline>;
  @useResult
  $Res call(
      {String id,
      @TimestampConverter() Timestamp onlineAt,
      @TimestampConverter() Timestamp offlineAt});
}

/// @nodoc
class _$MChatOnlineCopyWithImpl<$Res, $Val extends MChatOnline>
    implements $MChatOnlineCopyWith<$Res> {
  _$MChatOnlineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? onlineAt = null,
    Object? offlineAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      onlineAt: null == onlineAt
          ? _value.onlineAt
          : onlineAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      offlineAt: null == offlineAt
          ? _value.offlineAt
          : offlineAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MChatOnlineCopyWith<$Res>
    implements $MChatOnlineCopyWith<$Res> {
  factory _$$_MChatOnlineCopyWith(
          _$_MChatOnline value, $Res Function(_$_MChatOnline) then) =
      __$$_MChatOnlineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @TimestampConverter() Timestamp onlineAt,
      @TimestampConverter() Timestamp offlineAt});
}

/// @nodoc
class __$$_MChatOnlineCopyWithImpl<$Res>
    extends _$MChatOnlineCopyWithImpl<$Res, _$_MChatOnline>
    implements _$$_MChatOnlineCopyWith<$Res> {
  __$$_MChatOnlineCopyWithImpl(
      _$_MChatOnline _value, $Res Function(_$_MChatOnline) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? onlineAt = null,
    Object? offlineAt = null,
  }) {
    return _then(_$_MChatOnline(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      onlineAt: null == onlineAt
          ? _value.onlineAt
          : onlineAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      offlineAt: null == offlineAt
          ? _value.offlineAt
          : offlineAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MChatOnline implements _MChatOnline {
  const _$_MChatOnline(
      {required this.id,
      @TimestampConverter() required this.onlineAt,
      @TimestampConverter() required this.offlineAt});

  factory _$_MChatOnline.fromJson(Map<String, dynamic> json) =>
      _$$_MChatOnlineFromJson(json);

  @override
  final String id;
  @override
  @TimestampConverter()
  final Timestamp onlineAt;
  @override
  @TimestampConverter()
  final Timestamp offlineAt;

  @override
  String toString() {
    return 'MChatOnline(id: $id, onlineAt: $onlineAt, offlineAt: $offlineAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MChatOnline &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.onlineAt, onlineAt) ||
                other.onlineAt == onlineAt) &&
            (identical(other.offlineAt, offlineAt) ||
                other.offlineAt == offlineAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, onlineAt, offlineAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MChatOnlineCopyWith<_$_MChatOnline> get copyWith =>
      __$$_MChatOnlineCopyWithImpl<_$_MChatOnline>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MChatOnlineToJson(
      this,
    );
  }
}

abstract class _MChatOnline implements MChatOnline {
  const factory _MChatOnline(
          {required final String id,
          @TimestampConverter() required final Timestamp onlineAt,
          @TimestampConverter() required final Timestamp offlineAt}) =
      _$_MChatOnline;

  factory _MChatOnline.fromJson(Map<String, dynamic> json) =
      _$_MChatOnline.fromJson;

  @override
  String get id;
  @override
  @TimestampConverter()
  Timestamp get onlineAt;
  @override
  @TimestampConverter()
  Timestamp get offlineAt;
  @override
  @JsonKey(ignore: true)
  _$$_MChatOnlineCopyWith<_$_MChatOnline> get copyWith =>
      throw _privateConstructorUsedError;
}
