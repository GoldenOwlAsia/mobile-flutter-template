// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blob_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MBlob _$$_MBlobFromJson(Map<String, dynamic> json) => _$_MBlob(
      signedId: json['signed_id'] as String,
      byteSize: json['byte_size'] as int?,
      contentType: json['content_type'] as String?,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['created_at'], const IntToDateTimeConverter().fromJson),
      filename: json['filename'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_MBlobToJson(_$_MBlob instance) => <String, dynamic>{
      'signed_id': instance.signedId,
      'byte_size': instance.byteSize,
      'content_type': instance.contentType,
      'created_at': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const IntToDateTimeConverter().toJson),
      'filename': instance.filename,
      'url': instance.url,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
