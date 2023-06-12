// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../network/json_converter/int_to_datetime_converter.dart';

part 'blob_model.freezed.dart';
part 'blob_model.g.dart';

@freezed
class MBlob with _$MBlob {
  const factory MBlob({
    @JsonKey(name: 'signed_id') required String signedId,
    @JsonKey(name: 'byte_size') int? byteSize,
    @JsonKey(name: 'content_type') String? contentType,
    @IntToDateTimeConverter() @JsonKey(name: 'created_at') DateTime? createdAt,
    String? filename,
    required String url,
  }) = _MBlob;

  factory MBlob.fromJson(Map<String, Object?> json) => _$MBlobFromJson(json);
}
