// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../network/model/user/user.dart';

part 'chat_member.freezed.dart';
part 'chat_member.g.dart';
part 'chat_member.ext.dart';

@freezed
class MChatMember with _$MChatMember {
  const factory MChatMember({
    required String id,
    @Default('') String name,
    @Default('') String avatar,
    @Default(false) bool isShop,
    @Default(0) int countNewMessage,
  }) = _MChatMember;

  factory MChatMember.fromJson(Map<String, Object?> json) =>
      _$MChatMemberFromJson(json);

  factory MChatMember.fromUser(MUser item) => MChatMember(
        id: item.id,
        name: item.name ?? '',
        avatar: item.avatar ?? '',
        isShop: false,
      );
}
