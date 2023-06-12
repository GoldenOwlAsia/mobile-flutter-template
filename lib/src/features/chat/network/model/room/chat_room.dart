// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../../../network/model/user/user.dart';
import '../../json_converter/timestamp_converter.dart';
import '../member/chat_member.dart';
import '../message/chat_message.dart';
import 'chat_room.helper.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';
part 'chat_room.ext.dart';

@freezed
class MChatRoom with _$MChatRoom {
  factory MChatRoom.fromJson(Map<String, Object?> json) =>
      _$MChatRoomFromJson(json);
  factory MChatRoom.empty([String id = '']) {
    return MChatRoom(
        id: id, updatedAt: Timestamp.now(), createdAt: Timestamp.now());
  }
  const factory MChatRoom({
    required String id,
    MChatMessage? messageNew,
    @Default([]) List<MChatMember> members,
    @Default([]) List<String> userIds,
    @TimestampConverter() required Timestamp updatedAt,
    @TimestampConverter() required Timestamp createdAt,
  }) = _MChatRoom;

  factory MChatRoom.fromUsers(MUser user, MUser otherUser) {
    final roomId = MChatRoomHelper.idChatRoomOf(otherUser.id, user.id);
    final members = [
      MChatMember.fromUser(user),
      MChatMember.fromUser(otherUser),
    ];
    return MChatRoom(
      id: roomId,
      updatedAt: Timestamp.now(),
      createdAt: Timestamp.now(),
      members: members,
      userIds: members.map((e) => e.id).toList(),
    );
  }
}
