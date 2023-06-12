// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MChatMember _$$_MChatMemberFromJson(Map<String, dynamic> json) =>
    _$_MChatMember(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      isShop: json['is_shop'] as bool? ?? false,
      countNewMessage: json['count_new_message'] as int? ?? 0,
    );

Map<String, dynamic> _$$_MChatMemberToJson(_$_MChatMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'is_shop': instance.isShop,
      'count_new_message': instance.countNewMessage,
    };
