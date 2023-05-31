// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_reaction.freezed.dart';
part 'chat_reaction.g.dart';

@freezed
class MChatReaction with _$MChatReaction {
  const factory MChatReaction({
    @Default('') String memberId,
    @Default('') String reaction,
  }) = _MChatReaction;

  factory MChatReaction.fromJson(Map<String, Object?> json) =>
      _$MChatReactionFromJson(json);
}
