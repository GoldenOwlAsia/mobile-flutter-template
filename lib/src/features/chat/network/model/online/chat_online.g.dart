// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_online.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MChatOnline _$$_MChatOnlineFromJson(Map<String, dynamic> json) =>
    _$_MChatOnline(
      id: json['id'] as String,
      onlineAt:
          const TimestampConverter().fromJson(json['online_at'] as Timestamp),
      offlineAt:
          const TimestampConverter().fromJson(json['offline_at'] as Timestamp),
    );

Map<String, dynamic> _$$_MChatOnlineToJson(_$_MChatOnline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'online_at': const TimestampConverter().toJson(instance.onlineAt),
      'offline_at': const TimestampConverter().toJson(instance.offlineAt),
    };
