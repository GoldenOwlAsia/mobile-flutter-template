// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MUpload _$MUploadFromJson(Map<String, dynamic> json) {
  return _MUpload.fromJson(json);
}

/// @nodoc
mixin _$MUpload {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MUploadCopyWith<MUpload> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUploadCopyWith<$Res> {
  factory $MUploadCopyWith(MUpload value, $Res Function(MUpload) then) =
      _$MUploadCopyWithImpl<$Res, MUpload>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$MUploadCopyWithImpl<$Res, $Val extends MUpload>
    implements $MUploadCopyWith<$Res> {
  _$MUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MUploadCopyWith<$Res> implements $MUploadCopyWith<$Res> {
  factory _$$_MUploadCopyWith(
          _$_MUpload value, $Res Function(_$_MUpload) then) =
      __$$_MUploadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_MUploadCopyWithImpl<$Res>
    extends _$MUploadCopyWithImpl<$Res, _$_MUpload>
    implements _$$_MUploadCopyWith<$Res> {
  __$$_MUploadCopyWithImpl(_$_MUpload _value, $Res Function(_$_MUpload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_MUpload(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MUpload with DiagnosticableTreeMixin implements _MUpload {
  const _$_MUpload({required this.url});

  factory _$_MUpload.fromJson(Map<String, dynamic> json) =>
      _$$_MUploadFromJson(json);

  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MUpload(url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MUpload'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MUpload &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MUploadCopyWith<_$_MUpload> get copyWith =>
      __$$_MUploadCopyWithImpl<_$_MUpload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MUploadToJson(
      this,
    );
  }
}

abstract class _MUpload implements MUpload {
  const factory _MUpload({required final String url}) = _$_MUpload;

  factory _MUpload.fromJson(Map<String, dynamic> json) = _$_MUpload.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_MUploadCopyWith<_$_MUpload> get copyWith =>
      throw _privateConstructorUsedError;
}
