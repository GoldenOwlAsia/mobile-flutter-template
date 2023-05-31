import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../../features/account/logic/account_bloc.dart';
import '../../../localization/localization_utils.dart';
import '../../firestore/chat/chat_room_reference.dart';
import '../../model/common/result.dart';
import '../../model/user/user.dart';
import '../model/member/chat_member.dart';
import '../model/message/chat_message.dart';
import '../model/room/chat_room.dart';
import 'chat_room_repository.dart';

class ChatRoomRepositoryImpl extends ChatRoomRepository {
  final roomRef = ChatRoomReference();

  @override
  Future<MResult<MChatRoom>> chatWithUser(MUser otherUser) async {
    final user = GetIt.I<AccountBloc>().state.user;
    if (user.id.isEmpty) {
      return MResult.error(S.text.error_not_login_yet);
    }
    return roomRef.getAndUpdateChatRoomWithUser(user, otherUser);
  }

  @override
  Future<MResult<MChatRoom>> getChatRoomDetail(String id) {
    return roomRef.get(id);
  }

  @override
  Stream<List<MChatRoom>> getChatRoomsStream() {
    return roomRef.getChatRoomsStream();
  }

  @override
  Future<MResult> updateLastMessageForRoom(MChatMessage message) async {
    final roomResult = await roomRef.get(message.idChatRoom);
    if (roomResult.isError) {
      // Get room fail
      return roomResult;
    }
    MChatRoom room = roomResult.data!;
    List<MChatMember> members = [];
    for (var e in room.members) {
      if (e.id == message.idUserFrom) {
        members.add(e.copyWith(countNewMessage: 0));
      } else {
        members.add(e.copyWith(countNewMessage: e.countNewMessage + 1));
      }
    }
    room = room.copyWith(
        messageNew: message, updatedAt: Timestamp.now(), members: members);
    return roomRef.set(room);
  }

  @override
  Future<MResult<MChatRoom>> updateChatRoom(MChatRoom room) {
    return roomRef.set(room);
  }

  @override
  Future<MResult<MChatRoom>> readAllMessage(
      String userId, String roomId) async {
    final roomResult = await roomRef.get(roomId);
    if (roomResult.isError) {
      // Get room fail
      return roomResult;
    }
    final room = roomResult.data!.copyWithDecreaseUnseen(userId, 0);
    return roomRef.set(room);
  }
}
