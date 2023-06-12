// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChatMedia _$MChatMediaFromJson(Map<String, dynamic> json) {
  return _MChatMedia.fromJson(json);
}

/// @nodoc
mixin _$MChatMedia {
  String get url => throw _privateConstructorUsedError;
  MChatMediaType get fileType => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get orientation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChatMediaCopyWith<MChatMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChatMediaCopyWith<$Res> {
  factory $MChatMediaCopyWith(
          MChatMedia value, $Res Function(MChatMedia) then) =
      _$MChatMediaCopyWithImpl<$Res, MChatMedia>;
  @useResult
  $Res call(
      {String url,
      MChatMediaType fileType,
      int? duration,
      int? width,
      int? height,
      int? orientation});
}

/// @nodoc
class _$MChatMediaCopyWithImpl<$Res, $Val extends MChatMedia>
    implements $MChatMediaCopyWith<$Res> {
  _$MChatMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileType = null,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? orientation = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as MChatMediaType,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      orientation: freezed == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MChatMediaCopyWith<$Res>
    implements $MChatMediaCopyWith<$Res> {
  factory _$$_MChatMediaCopyWith(
          _$_MChatMedia value, $Res Function(_$_MChatMedia) then) =
      __$$_MChatMediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      MChatMediaType fileType,
      int? duration,
      int? width,
      int? height,
      int? orientation});
}

/// @nodoc
class __$$_MChatMediaCopyWithImpl<$Res>
    extends _$MChatMediaCopyWithImpl<$Res, _$_MChatMedia>
    implements _$$_MChatMediaCopyWith<$Res> {
  __$$_MChatMediaCopyWithImpl(
      _$_MChatMedia _value, $Res Function(_$_MChatMedia) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileType = null,
    Object? duration = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? orientation = freezed,
  }) {
    return _then(_$_MChatMedia(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as MChatMediaType,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      orientation: freezed == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MChatMedia with DiagnosticableTreeMixin implements _MChatMedia {
  const _$_MChatMedia(
      {this.url = '',
      this.fileType = MChatMediaType.image,
      this.duration,
      this.width,
      this.height,
      this.orientation});

  factory _$_MChatMedia.fromJson(Map<String, dynamic> json) =>
      _$$_MChatMediaFromJson(json);

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final MChatMediaType fileType;
  @override
  final int? duration;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final int? orientation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MChatMedia(url: $url, fileType: $fileType, duration: $duration, width: $width, height: $height, orientation: $orientation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MChatMedia'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('fileType', fileType))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('orientation', orientation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MChatMedia &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, fileType, duration, width, height, orientation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MChatMediaCopyWith<_$_MChatMedia> get copyWith =>
      __$$_MChatMediaCopyWithImpl<_$_MChatMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MChatMediaToJson(
      this,
    );
  }
}

abstract class _MChatMedia implements MChatMedia {
  const factory _MChatMedia(
      {final String url,
      final MChatMediaType fileType,
      final int? duration,
      final int? width,
      final int? height,
      final int? orientation}) = _$_MChatMedia;

  factory _MChatMedia.fromJson(Map<String, dynamic> json) =
      _$_MChatMedia.fromJson;

  @override
  String get url;
  @override
  MChatMediaType get fileType;
  @override
  int? get duration;
  @override
  int? get width;
  @override
  int? get height;
  @override
  int? get orientation;
  @override
  @JsonKey(ignore: true)
  _$$_MChatMediaCopyWith<_$_MChatMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
