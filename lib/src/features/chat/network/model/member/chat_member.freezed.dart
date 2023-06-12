// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChatMember _$MChatMemberFromJson(Map<String, dynamic> json) {
  return _MChatMember.fromJson(json);
}

/// @nodoc
mixin _$MChatMember {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  bool get isShop => throw _privateConstructorUsedError;
  int get countNewMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChatMemberCopyWith<MChatMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChatMemberCopyWith<$Res> {
  factory $MChatMemberCopyWith(
          MChatMember value, $Res Function(MChatMember) then) =
      _$MChatMemberCopyWithImpl<$Res, MChatMember>;
  @useResult
  $Res call(
      {String id,
      String name,
      String avatar,
      bool isShop,
      int countNewMessage});
}

/// @nodoc
class _$MChatMemberCopyWithImpl<$Res, $Val extends MChatMember>
    implements $MChatMemberCopyWith<$Res> {
  _$MChatMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? isShop = null,
    Object? countNewMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      isShop: null == isShop
          ? _value.isShop
          : isShop // ignore: cast_nullable_to_non_nullable
              as bool,
      countNewMessage: null == countNewMessage
          ? _value.countNewMessage
          : countNewMessage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MChatMemberCopyWith<$Res>
    implements $MChatMemberCopyWith<$Res> {
  factory _$$_MChatMemberCopyWith(
          _$_MChatMember value, $Res Function(_$_MChatMember) then) =
      __$$_MChatMemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String avatar,
      bool isShop,
      int countNewMessage});
}

/// @nodoc
class __$$_MChatMemberCopyWithImpl<$Res>
    extends _$MChatMemberCopyWithImpl<$Res, _$_MChatMember>
    implements _$$_MChatMemberCopyWith<$Res> {
  __$$_MChatMemberCopyWithImpl(
      _$_MChatMember _value, $Res Function(_$_MChatMember) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
    Object? isShop = null,
    Object? countNewMessage = null,
  }) {
    return _then(_$_MChatMember(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      isShop: null == isShop
          ? _value.isShop
          : isShop // ignore: cast_nullable_to_non_nullable
              as bool,
      countNewMessage: null == countNewMessage
          ? _value.countNewMessage
          : countNewMessage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MChatMember with DiagnosticableTreeMixin implements _MChatMember {
  const _$_MChatMember(
      {required this.id,
      this.name = '',
      this.avatar = '',
      this.isShop = false,
      this.countNewMessage = 0});

  factory _$_MChatMember.fromJson(Map<String, dynamic> json) =>
      _$$_MChatMemberFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final bool isShop;
  @override
  @JsonKey()
  final int countNewMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MChatMember(id: $id, name: $name, avatar: $avatar, isShop: $isShop, countNewMessage: $countNewMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MChatMember'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('isShop', isShop))
      ..add(DiagnosticsProperty('countNewMessage', countNewMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MChatMember &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isShop, isShop) || other.isShop == isShop) &&
            (identical(other.countNewMessage, countNewMessage) ||
                other.countNewMessage == countNewMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, avatar, isShop, countNewMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MChatMemberCopyWith<_$_MChatMember> get copyWith =>
      __$$_MChatMemberCopyWithImpl<_$_MChatMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MChatMemberToJson(
      this,
    );
  }
}

abstract class _MChatMember implements MChatMember {
  const factory _MChatMember(
      {required final String id,
      final String name,
      final String avatar,
      final bool isShop,
      final int countNewMessage}) = _$_MChatMember;

  factory _MChatMember.fromJson(Map<String, dynamic> json) =
      _$_MChatMember.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  bool get isShop;
  @override
  int get countNewMessage;
  @override
  @JsonKey(ignore: true)
  _$$_MChatMemberCopyWith<_$_MChatMember> get copyWith =>
      throw _privateConstructorUsedError;
}
