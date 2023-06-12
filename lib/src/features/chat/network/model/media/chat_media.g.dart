// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MChatMedia _$$_MChatMediaFromJson(Map<String, dynamic> json) =>
    _$_MChatMedia(
      url: json['url'] as String? ?? '',
      fileType:
          $enumDecodeNullable(_$MChatMediaTypeEnumMap, json['file_type']) ??
              MChatMediaType.image,
      duration: json['duration'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      orientation: json['orientation'] as int?,
    );

Map<String, dynamic> _$$_MChatMediaToJson(_$_MChatMedia instance) =>
    <String, dynamic>{
      'url': instance.url,
      'file_type': _$MChatMediaTypeEnumMap[instance.fileType]!,
      'duration': instance.duration,
      'width': instance.width,
      'height': instance.height,
      'orientation': instance.orientation,
    };

const _$MChatMediaTypeEnumMap = {
  MChatMediaType.other: 'other',
  MChatMediaType.image: 'image',
  MChatMediaType.video: 'video',
  MChatMediaType.audio: 'audio',
};
