// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MChatReaction _$MChatReactionFromJson(Map<String, dynamic> json) {
  return _MChatReaction.fromJson(json);
}

/// @nodoc
mixin _$MChatReaction {
  String get memberId => throw _privateConstructorUsedError;
  String get reaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MChatReactionCopyWith<MChatReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MChatReactionCopyWith<$Res> {
  factory $MChatReactionCopyWith(
          MChatReaction value, $Res Function(MChatReaction) then) =
      _$MChatReactionCopyWithImpl<$Res, MChatReaction>;
  @useResult
  $Res call({String memberId, String reaction});
}

/// @nodoc
class _$MChatReactionCopyWithImpl<$Res, $Val extends MChatReaction>
    implements $MChatReactionCopyWith<$Res> {
  _$MChatReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? reaction = null,
  }) {
    return _then(_value.copyWith(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MChatReactionCopyWith<$Res>
    implements $MChatReactionCopyWith<$Res> {
  factory _$$_MChatReactionCopyWith(
          _$_MChatReaction value, $Res Function(_$_MChatReaction) then) =
      __$$_MChatReactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String memberId, String reaction});
}

/// @nodoc
class __$$_MChatReactionCopyWithImpl<$Res>
    extends _$MChatReactionCopyWithImpl<$Res, _$_MChatReaction>
    implements _$$_MChatReactionCopyWith<$Res> {
  __$$_MChatReactionCopyWithImpl(
      _$_MChatReaction _value, $Res Function(_$_MChatReaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberId = null,
    Object? reaction = null,
  }) {
    return _then(_$_MChatReaction(
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MChatReaction with DiagnosticableTreeMixin implements _MChatReaction {
  const _$_MChatReaction({this.memberId = '', this.reaction = ''});

  factory _$_MChatReaction.fromJson(Map<String, dynamic> json) =>
      _$$_MChatReactionFromJson(json);

  @override
  @JsonKey()
  final String memberId;
  @override
  @JsonKey()
  final String reaction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MChatReaction(memberId: $memberId, reaction: $reaction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MChatReaction'))
      ..add(DiagnosticsProperty('memberId', memberId))
      ..add(DiagnosticsProperty('reaction', reaction));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MChatReaction &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memberId, reaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MChatReactionCopyWith<_$_MChatReaction> get copyWith =>
      __$$_MChatReactionCopyWithImpl<_$_MChatReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MChatReactionToJson(
      this,
    );
  }
}

abstract class _MChatReaction implements MChatReaction {
  const factory _MChatReaction({final String memberId, final String reaction}) =
      _$_MChatReaction;

  factory _MChatReaction.fromJson(Map<String, dynamic> json) =
      _$_MChatReaction.fromJson;

  @override
  String get memberId;
  @override
  String get reaction;
  @override
  @JsonKey(ignore: true)
  _$$_MChatReactionCopyWith<_$_MChatReaction> get copyWith =>
      throw _privateConstructorUsedError;
}
