// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blob_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MBlob _$MBlobFromJson(Map<String, dynamic> json) {
  return _MBlob.fromJson(json);
}

/// @nodoc
mixin _$MBlob {
  @JsonKey(name: 'signed_id')
  String get signedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'byte_size')
  int? get byteSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @IntToDateTimeConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MBlobCopyWith<MBlob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MBlobCopyWith<$Res> {
  factory $MBlobCopyWith(MBlob value, $Res Function(MBlob) then) =
      _$MBlobCopyWithImpl<$Res, MBlob>;
  @useResult
  $Res call(
      {@JsonKey(name: 'signed_id')
          String signedId,
      @JsonKey(name: 'byte_size')
          int? byteSize,
      @JsonKey(name: 'content_type')
          String? contentType,
      @IntToDateTimeConverter()
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      String? filename,
      String url});
}

/// @nodoc
class _$MBlobCopyWithImpl<$Res, $Val extends MBlob>
    implements $MBlobCopyWith<$Res> {
  _$MBlobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedId = null,
    Object? byteSize = freezed,
    Object? contentType = freezed,
    Object? createdAt = freezed,
    Object? filename = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      signedId: null == signedId
          ? _value.signedId
          : signedId // ignore: cast_nullable_to_non_nullable
              as String,
      byteSize: freezed == byteSize
          ? _value.byteSize
          : byteSize // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MBlobCopyWith<$Res> implements $MBlobCopyWith<$Res> {
  factory _$$_MBlobCopyWith(_$_MBlob value, $Res Function(_$_MBlob) then) =
      __$$_MBlobCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'signed_id')
          String signedId,
      @JsonKey(name: 'byte_size')
          int? byteSize,
      @JsonKey(name: 'content_type')
          String? contentType,
      @IntToDateTimeConverter()
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      String? filename,
      String url});
}

/// @nodoc
class __$$_MBlobCopyWithImpl<$Res> extends _$MBlobCopyWithImpl<$Res, _$_MBlob>
    implements _$$_MBlobCopyWith<$Res> {
  __$$_MBlobCopyWithImpl(_$_MBlob _value, $Res Function(_$_MBlob) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedId = null,
    Object? byteSize = freezed,
    Object? contentType = freezed,
    Object? createdAt = freezed,
    Object? filename = freezed,
    Object? url = null,
  }) {
    return _then(_$_MBlob(
      signedId: null == signedId
          ? _value.signedId
          : signedId // ignore: cast_nullable_to_non_nullable
              as String,
      byteSize: freezed == byteSize
          ? _value.byteSize
          : byteSize // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MBlob with DiagnosticableTreeMixin implements _MBlob {
  const _$_MBlob(
      {@JsonKey(name: 'signed_id') required this.signedId,
      @JsonKey(name: 'byte_size') this.byteSize,
      @JsonKey(name: 'content_type') this.contentType,
      @IntToDateTimeConverter() @JsonKey(name: 'created_at') this.createdAt,
      this.filename,
      required this.url});

  factory _$_MBlob.fromJson(Map<String, dynamic> json) =>
      _$$_MBlobFromJson(json);

  @override
  @JsonKey(name: 'signed_id')
  final String signedId;
  @override
  @JsonKey(name: 'byte_size')
  final int? byteSize;
  @override
  @JsonKey(name: 'content_type')
  final String? contentType;
  @override
  @IntToDateTimeConverter()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  final String? filename;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MBlob(signedId: $signedId, byteSize: $byteSize, contentType: $contentType, createdAt: $createdAt, filename: $filename, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MBlob'))
      ..add(DiagnosticsProperty('signedId', signedId))
      ..add(DiagnosticsProperty('byteSize', byteSize))
      ..add(DiagnosticsProperty('contentType', contentType))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('filename', filename))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MBlob &&
            (identical(other.signedId, signedId) ||
                other.signedId == signedId) &&
            (identical(other.byteSize, byteSize) ||
                other.byteSize == byteSize) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, signedId, byteSize, contentType, createdAt, filename, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MBlobCopyWith<_$_MBlob> get copyWith =>
      __$$_MBlobCopyWithImpl<_$_MBlob>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MBlobToJson(
      this,
    );
  }
}

abstract class _MBlob implements MBlob {
  const factory _MBlob(
      {@JsonKey(name: 'signed_id')
          required final String signedId,
      @JsonKey(name: 'byte_size')
          final int? byteSize,
      @JsonKey(name: 'content_type')
          final String? contentType,
      @IntToDateTimeConverter()
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      final String? filename,
      required final String url}) = _$_MBlob;

  factory _MBlob.fromJson(Map<String, dynamic> json) = _$_MBlob.fromJson;

  @override
  @JsonKey(name: 'signed_id')
  String get signedId;
  @override
  @JsonKey(name: 'byte_size')
  int? get byteSize;
  @override
  @JsonKey(name: 'content_type')
  String? get contentType;
  @override
  @IntToDateTimeConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  String? get filename;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_MBlobCopyWith<_$_MBlob> get copyWith =>
      throw _privateConstructorUsedError;
}
