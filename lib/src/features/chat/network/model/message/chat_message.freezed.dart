// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChatMessage _$MChatMessageFromJson(Map<String, dynamic> json) {
  return _MChatMessage.fromJson(json);
}

/// @nodoc
mixin _$MChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  MChatMessage? get messageReply => throw _privateConstructorUsedError;
  String get idUserFrom => throw _privateConstructorUsedError;
  String get idChatRoom => throw _privateConstructorUsedError;
  List<MChatMedia> get medias => throw _privateConstructorUsedError;
  List<MChatReaction> get reactions => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChatMessageCopyWith<MChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChatMessageCopyWith<$Res> {
  factory $MChatMessageCopyWith(
          MChatMessage value, $Res Function(MChatMessage) then) =
      _$MChatMessageCopyWithImpl<$Res, MChatMessage>;
  @useResult
  $Res call(
      {String id,
      String content,
      MChatMessage? messageReply,
      String idUserFrom,
      String idChatRoom,
      List<MChatMedia> medias,
      List<MChatReaction> reactions,
      bool isRead,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});

  $MChatMessageCopyWith<$Res>? get messageReply;
}

/// @nodoc
class _$MChatMessageCopyWithImpl<$Res, $Val extends MChatMessage>
    implements $MChatMessageCopyWith<$Res> {
  _$MChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? messageReply = freezed,
    Object? idUserFrom = null,
    Object? idChatRoom = null,
    Object? medias = null,
    Object? reactions = null,
    Object? isRead = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      messageReply: freezed == messageReply
          ? _value.messageReply
          : messageReply // ignore: cast_nullable_to_non_nullable
              as MChatMessage?,
      idUserFrom: null == idUserFrom
          ? _value.idUserFrom
          : idUserFrom // ignore: cast_nullable_to_non_nullable
              as String,
      idChatRoom: null == idChatRoom
          ? _value.idChatRoom
          : idChatRoom // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<MChatMedia>,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<MChatReaction>,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MChatMessageCopyWith<$Res>? get messageReply {
    if (_value.messageReply == null) {
      return null;
    }

    return $MChatMessageCopyWith<$Res>(_value.messageReply!, (value) {
      return _then(_value.copyWith(messageReply: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MChatMessageCopyWith<$Res>
    implements $MChatMessageCopyWith<$Res> {
  factory _$$_MChatMessageCopyWith(
          _$_MChatMessage value, $Res Function(_$_MChatMessage) then) =
      __$$_MChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      MChatMessage? messageReply,
      String idUserFrom,
      String idChatRoom,
      List<MChatMedia> medias,
      List<MChatReaction> reactions,
      bool isRead,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});

  @override
  $MChatMessageCopyWith<$Res>? get messageReply;
}

/// @nodoc
class __$$_MChatMessageCopyWithImpl<$Res>
    extends _$MChatMessageCopyWithImpl<$Res, _$_MChatMessage>
    implements _$$_MChatMessageCopyWith<$Res> {
  __$$_MChatMessageCopyWithImpl(
      _$_MChatMessage _value, $Res Function(_$_MChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? messageReply = freezed,
    Object? idUserFrom = null,
    Object? idChatRoom = null,
    Object? medias = null,
    Object? reactions = null,
    Object? isRead = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_MChatMessage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      messageReply: freezed == messageReply
          ? _value.messageReply
          : messageReply // ignore: cast_nullable_to_non_nullable
              as MChatMessage?,
      idUserFrom: null == idUserFrom
          ? _value.idUserFrom
          : idUserFrom // ignore: cast_nullable_to_non_nullable
              as String,
      idChatRoom: null == idChatRoom
          ? _value.idChatRoom
          : idChatRoom // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<MChatMedia>,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<MChatReaction>,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MChatMessage with DiagnosticableTreeMixin implements _MChatMessage {
  const _$_MChatMessage(
      {required this.id,
      this.content = '',
      this.messageReply,
      this.idUserFrom = '',
      this.idChatRoom = '',
      final List<MChatMedia> medias = const [],
      final List<MChatReaction> reactions = const [],
      this.isRead = false,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _medias = medias,
        _reactions = reactions;

  factory _$_MChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_MChatMessageFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String content;
  @override
  final MChatMessage? messageReply;
  @override
  @JsonKey()
  final String idUserFrom;
  @override
  @JsonKey()
  final String idChatRoom;
  final List<MChatMedia> _medias;
  @override
  @JsonKey()
  List<MChatMedia> get medias {
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medias);
  }

  final List<MChatReaction> _reactions;
  @override
  @JsonKey()
  List<MChatReaction> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  @override
  @JsonKey()
  final bool isRead;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MChatMessage(id: $id, content: $content, messageReply: $messageReply, idUserFrom: $idUserFrom, idChatRoom: $idChatRoom, medias: $medias, reactions: $reactions, isRead: $isRead, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MChatMessage'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('messageReply', messageReply))
      ..add(DiagnosticsProperty('idUserFrom', idUserFrom))
      ..add(DiagnosticsProperty('idChatRoom', idChatRoom))
      ..add(DiagnosticsProperty('medias', medias))
      ..add(DiagnosticsProperty('reactions', reactions))
      ..add(DiagnosticsProperty('isRead', isRead))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MChatMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.messageReply, messageReply) ||
                other.messageReply == messageReply) &&
            (identical(other.idUserFrom, idUserFrom) ||
                other.idUserFrom == idUserFrom) &&
            (identical(other.idChatRoom, idChatRoom) ||
                other.idChatRoom == idChatRoom) &&
            const DeepCollectionEquality().equals(other._medias, _medias) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      messageReply,
      idUserFrom,
      idChatRoom,
      const DeepCollectionEquality().hash(_medias),
      const DeepCollectionEquality().hash(_reactions),
      isRead,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MChatMessageCopyWith<_$_MChatMessage> get copyWith =>
      __$$_MChatMessageCopyWithImpl<_$_MChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MChatMessageToJson(
      this,
    );
  }
}

abstract class _MChatMessage implements MChatMessage {
  const factory _MChatMessage(
          {required final String id,
          final String content,
          final MChatMessage? messageReply,
          final String idUserFrom,
          final String idChatRoom,
          final List<MChatMedia> medias,
          final List<MChatReaction> reactions,
          final bool isRead,
          @TimestampConverter() required final Timestamp createdAt,
          @TimestampConverter() required final Timestamp updatedAt}) =
      _$_MChatMessage;

  factory _MChatMessage.fromJson(Map<String, dynamic> json) =
      _$_MChatMessage.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  MChatMessage? get messageReply;
  @override
  String get idUserFrom;
  @override
  String get idChatRoom;
  @override
  List<MChatMedia> get medias;
  @override
  List<MChatReaction> get reactions;
  @override
  bool get isRead;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MChatMessageCopyWith<_$_MChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
