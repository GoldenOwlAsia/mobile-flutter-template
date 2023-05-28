// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChatRoom _$MChatRoomFromJson(Map<String, dynamic> json) {
  return _MChatRoom.fromJson(json);
}

/// @nodoc
mixin _$MChatRoom {
  String get id => throw _privateConstructorUsedError;
  MChatMessage? get messageNew => throw _privateConstructorUsedError;
  List<MChatMember> get members => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChatRoomCopyWith<MChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChatRoomCopyWith<$Res> {
  factory $MChatRoomCopyWith(MChatRoom value, $Res Function(MChatRoom) then) =
      _$MChatRoomCopyWithImpl<$Res, MChatRoom>;
  @useResult
  $Res call(
      {String id,
      MChatMessage? messageNew,
      List<MChatMember> members,
      List<String> userIds,
      @TimestampConverter() Timestamp updatedAt,
      @TimestampConverter() Timestamp createdAt});

  $MChatMessageCopyWith<$Res>? get messageNew;
}

/// @nodoc
class _$MChatRoomCopyWithImpl<$Res, $Val extends MChatRoom>
    implements $MChatRoomCopyWith<$Res> {
  _$MChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageNew = freezed,
    Object? members = null,
    Object? userIds = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageNew: freezed == messageNew
          ? _value.messageNew
          : messageNew // ignore: cast_nullable_to_non_nullable
              as MChatMessage?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MChatMember>,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MChatMessageCopyWith<$Res>? get messageNew {
    if (_value.messageNew == null) {
      return null;
    }

    return $MChatMessageCopyWith<$Res>(_value.messageNew!, (value) {
      return _then(_value.copyWith(messageNew: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MChatRoomCopyWith<$Res> implements $MChatRoomCopyWith<$Res> {
  factory _$$_MChatRoomCopyWith(
          _$_MChatRoom value, $Res Function(_$_MChatRoom) then) =
      __$$_MChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MChatMessage? messageNew,
      List<MChatMember> members,
      List<String> userIds,
      @TimestampConverter() Timestamp updatedAt,
      @TimestampConverter() Timestamp createdAt});

  @override
  $MChatMessageCopyWith<$Res>? get messageNew;
}

/// @nodoc
class __$$_MChatRoomCopyWithImpl<$Res>
    extends _$MChatRoomCopyWithImpl<$Res, _$_MChatRoom>
    implements _$$_MChatRoomCopyWith<$Res> {
  __$$_MChatRoomCopyWithImpl(
      _$_MChatRoom _value, $Res Function(_$_MChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageNew = freezed,
    Object? members = null,
    Object? userIds = null,
    Object? updatedAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$_MChatRoom(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageNew: freezed == messageNew
          ? _value.messageNew
          : messageNew // ignore: cast_nullable_to_non_nullable
              as MChatMessage?,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MChatMember>,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MChatRoom implements _MChatRoom {
  const _$_MChatRoom(
      {required this.id,
      this.messageNew,
      final List<MChatMember> members = const [],
      final List<String> userIds = const [],
      @TimestampConverter() required this.updatedAt,
      @TimestampConverter() required this.createdAt})
      : _members = members,
        _userIds = userIds;

  factory _$_MChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_MChatRoomFromJson(json);

  @override
  final String id;
  @override
  final MChatMessage? messageNew;
  final List<MChatMember> _members;
  @override
  @JsonKey()
  List<MChatMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<String> _userIds;
  @override
  @JsonKey()
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  @TimestampConverter()
  final Timestamp updatedAt;
  @override
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'MChatRoom(id: $id, messageNew: $messageNew, members: $members, userIds: $userIds, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MChatRoom &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageNew, messageNew) ||
                other.messageNew == messageNew) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      messageNew,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_userIds),
      updatedAt,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MChatRoomCopyWith<_$_MChatRoom> get copyWith =>
      __$$_MChatRoomCopyWithImpl<_$_MChatRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MChatRoomToJson(
      this,
    );
  }
}

abstract class _MChatRoom implements MChatRoom {
  const factory _MChatRoom(
      {required final String id,
      final MChatMessage? messageNew,
      final List<MChatMember> members,
      final List<String> userIds,
      @TimestampConverter() required final Timestamp updatedAt,
      @TimestampConverter() required final Timestamp createdAt}) = _$_MChatRoom;

  factory _MChatRoom.fromJson(Map<String, dynamic> json) =
      _$_MChatRoom.fromJson;

  @override
  String get id;
  @override
  MChatMessage? get messageNew;
  @override
  List<MChatMember> get members;
  @override
  List<String> get userIds;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MChatRoomCopyWith<_$_MChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
