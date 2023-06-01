// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MChatReaction _$$_MChatReactionFromJson(Map<String, dynamic> json) =>
    _$_MChatReaction(
      memberId: json['member_id'] as String? ?? '',
      reaction: json['reaction'] as String? ?? '',
    );

Map<String, dynamic> _$$_MChatReactionToJson(_$_MChatReaction instance) =>
    <String, dynamic>{
      'member_id': instance.memberId,
      'reaction': instance.reaction,
    };
