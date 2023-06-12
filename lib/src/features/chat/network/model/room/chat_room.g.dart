// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MChatRoom _$$_MChatRoomFromJson(Map<String, dynamic> json) => _$_MChatRoom(
      id: json['id'] as String,
      messageNew: json['message_new'] == null
          ? null
          : MChatMessage.fromJson(json['message_new'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => MChatMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userIds: (json['user_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp),
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$_MChatRoomToJson(_$_MChatRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message_new': instance.messageNew?.toJson(),
      'members': instance.members.map((e) => e.toJson()).toList(),
      'user_ids': instance.userIds,
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
