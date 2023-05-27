// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MPaginationMeta _$MPaginationMetaFromJson(Map<String, dynamic> json) {
  return _MPaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$MPaginationMeta {
  @JsonKey(name: 'page_size')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_number')
  int get pageNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_page')
  int? get prevPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_page')
  int? get nextPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MPaginationMetaCopyWith<MPaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPaginationMetaCopyWith<$Res> {
  factory $MPaginationMetaCopyWith(
          MPaginationMeta value, $Res Function(MPaginationMeta) then) =
      _$MPaginationMetaCopyWithImpl<$Res, MPaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page_size') int pageSize,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'page_number') int pageNumber,
      @JsonKey(name: 'prev_page') int? prevPage,
      @JsonKey(name: 'next_page') int? nextPage,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$MPaginationMetaCopyWithImpl<$Res, $Val extends MPaginationMeta>
    implements $MPaginationMetaCopyWith<$Res> {
  _$MPaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? totalCount = null,
    Object? pageNumber = null,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MPaginationMetaCopyWith<$Res>
    implements $MPaginationMetaCopyWith<$Res> {
  factory _$$_MPaginationMetaCopyWith(
          _$_MPaginationMeta value, $Res Function(_$_MPaginationMeta) then) =
      __$$_MPaginationMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page_size') int pageSize,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'page_number') int pageNumber,
      @JsonKey(name: 'prev_page') int? prevPage,
      @JsonKey(name: 'next_page') int? nextPage,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$$_MPaginationMetaCopyWithImpl<$Res>
    extends _$MPaginationMetaCopyWithImpl<$Res, _$_MPaginationMeta>
    implements _$$_MPaginationMetaCopyWith<$Res> {
  __$$_MPaginationMetaCopyWithImpl(
      _$_MPaginationMeta _value, $Res Function(_$_MPaginationMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? totalCount = null,
    Object? pageNumber = null,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
    Object? lastPage = null,
  }) {
    return _then(_$_MPaginationMeta(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MPaginationMeta
    with DiagnosticableTreeMixin
    implements _MPaginationMeta {
  const _$_MPaginationMeta(
      {@JsonKey(name: 'page_size') required this.pageSize,
      @JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'page_number') required this.pageNumber,
      @JsonKey(name: 'prev_page') this.prevPage = 0,
      @JsonKey(name: 'next_page') this.nextPage = 0,
      @JsonKey(name: 'last_page') required this.lastPage});

  factory _$_MPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$$_MPaginationMetaFromJson(json);

  @override
  @JsonKey(name: 'page_size')
  final int pageSize;
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'page_number')
  final int pageNumber;
  @override
  @JsonKey(name: 'prev_page')
  final int? prevPage;
  @override
  @JsonKey(name: 'next_page')
  final int? nextPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MPaginationMeta(pageSize: $pageSize, totalCount: $totalCount, pageNumber: $pageNumber, prevPage: $prevPage, nextPage: $nextPage, lastPage: $lastPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MPaginationMeta'))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('pageNumber', pageNumber))
      ..add(DiagnosticsProperty('prevPage', prevPage))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('lastPage', lastPage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MPaginationMeta &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, totalCount, pageNumber,
      prevPage, nextPage, lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MPaginationMetaCopyWith<_$_MPaginationMeta> get copyWith =>
      __$$_MPaginationMetaCopyWithImpl<_$_MPaginationMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MPaginationMetaToJson(
      this,
    );
  }
}

abstract class _MPaginationMeta implements MPaginationMeta {
  const factory _MPaginationMeta(
          {@JsonKey(name: 'page_size') required final int pageSize,
          @JsonKey(name: 'total_count') required final int totalCount,
          @JsonKey(name: 'page_number') required final int pageNumber,
          @JsonKey(name: 'prev_page') final int? prevPage,
          @JsonKey(name: 'next_page') final int? nextPage,
          @JsonKey(name: 'last_page') required final int lastPage}) =
      _$_MPaginationMeta;

  factory _MPaginationMeta.fromJson(Map<String, dynamic> json) =
      _$_MPaginationMeta.fromJson;

  @override
  @JsonKey(name: 'page_size')
  int get pageSize;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'page_number')
  int get pageNumber;
  @override
  @JsonKey(name: 'prev_page')
  int? get prevPage;
  @override
  @JsonKey(name: 'next_page')
  int? get nextPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$_MPaginationMetaCopyWith<_$_MPaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
