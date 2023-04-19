// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MPagination<T> {
  int get pageCount => throw _privateConstructorUsedError;
  MHandle<void> get status => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MPaginationCopyWith<T, MPagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPaginationCopyWith<T, $Res> {
  factory $MPaginationCopyWith(
          MPagination<T> value, $Res Function(MPagination<T>) then) =
      _$MPaginationCopyWithImpl<T, $Res, MPagination<T>>;
  @useResult
  $Res call({int pageCount, MHandle<void> status, bool hasMore, List<T> items});

  $MHandleCopyWith<void, $Res> get status;
}

/// @nodoc
class _$MPaginationCopyWithImpl<T, $Res, $Val extends MPagination<T>>
    implements $MPaginationCopyWith<T, $Res> {
  _$MPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageCount = null,
    Object? status = null,
    Object? hasMore = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MHandle<void>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MHandleCopyWith<void, $Res> get status {
    return $MHandleCopyWith<void, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MPaginationCopyWith<T, $Res>
    implements $MPaginationCopyWith<T, $Res> {
  factory _$$_MPaginationCopyWith(
          _$_MPagination<T> value, $Res Function(_$_MPagination<T>) then) =
      __$$_MPaginationCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int pageCount, MHandle<void> status, bool hasMore, List<T> items});

  @override
  $MHandleCopyWith<void, $Res> get status;
}

/// @nodoc
class __$$_MPaginationCopyWithImpl<T, $Res>
    extends _$MPaginationCopyWithImpl<T, $Res, _$_MPagination<T>>
    implements _$$_MPaginationCopyWith<T, $Res> {
  __$$_MPaginationCopyWithImpl(
      _$_MPagination<T> _value, $Res Function(_$_MPagination<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageCount = null,
    Object? status = null,
    Object? hasMore = null,
    Object? items = null,
  }) {
    return _then(_$_MPagination<T>(
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MHandle<void>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_MPagination<T> extends _MPagination<T> {
  const _$_MPagination(
      {this.pageCount = 15,
      this.status = const MHandle.initial(),
      this.hasMore = true,
      final List<T> items = const []})
      : _items = items,
        super._();

  @override
  @JsonKey()
  final int pageCount;
  @override
  @JsonKey()
  final MHandle<void> status;
  @override
  @JsonKey()
  final bool hasMore;
  final List<T> _items;
  @override
  @JsonKey()
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'MPagination<$T>(pageCount: $pageCount, status: $status, hasMore: $hasMore, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MPagination<T> &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageCount, status, hasMore,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MPaginationCopyWith<T, _$_MPagination<T>> get copyWith =>
      __$$_MPaginationCopyWithImpl<T, _$_MPagination<T>>(this, _$identity);
}

abstract class _MPagination<T> extends MPagination<T> {
  const factory _MPagination(
      {final int pageCount,
      final MHandle<void> status,
      final bool hasMore,
      final List<T> items}) = _$_MPagination<T>;
  const _MPagination._() : super._();

  @override
  int get pageCount;
  @override
  MHandle<void> get status;
  @override
  bool get hasMore;
  @override
  List<T> get items;
  @override
  @JsonKey(ignore: true)
  _$$_MPaginationCopyWith<T, _$_MPagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
