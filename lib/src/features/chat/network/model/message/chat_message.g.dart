// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MChatMessage _$$_MChatMessageFromJson(Map<String, dynamic> json) =>
    _$_MChatMessage(
      id: json['id'] as String,
      content: json['content'] as String? ?? '',
      messageReply: json['message_reply'] == null
          ? null
          : MChatMessage.fromJson(
              json['message_reply'] as Map<String, dynamic>),
      idUserFrom: json['id_user_from'] as String? ?? '',
      idChatRoom: json['id_chat_room'] as String? ?? '',
      medias: (json['medias'] as List<dynamic>?)
              ?.map((e) => MChatMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => MChatReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isRead: json['is_read'] as bool? ?? false,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp),
    );

Map<String, dynamic> _$$_MChatMessageToJson(_$_MChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'message_reply': instance.messageReply?.toJson(),
      'id_user_from': instance.idUserFrom,
      'id_chat_room': instance.idChatRoom,
      'medias': instance.medias.map((e) => e.toJson()).toList(),
      'reactions': instance.reactions.map((e) => e.toJson()).toList(),
      'is_read': instance.isRead,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
