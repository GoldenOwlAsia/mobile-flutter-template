import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/model/common/result.dart';
import '../../../../network/model/user/user.dart';
import '../../../account/logic/account_bloc.dart';
import '../firestore/chat/chat_room_reference.dart';
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
  Future<MResult> updateLastMessage(MChatMessage message) async {
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
    return roomRef.update(message.idChatRoom, {
      'messageNew': message.toJson(),
      'time': Timestamp.now(),
      'members': members,
    });
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

  @override
  Future<MResult> deleteChatroom(String id) {
    return roomRef.delete(id);
  }

  @override
  Future<MResult<MChatRoom>> getChatRoomById(String chatRoomId) {
    return roomRef.get(chatRoomId);
  }

  @override
  Future<MResult<MChatRoom>> readLastMessage(
      MChatRoom chatRoom, String currentId) async {
    final room = chatRoom.copyWith();
    final List<MChatMember> members = List.from(room.members);
    for (int i = 0; i < members.length; i++) {
      if (members[i].id == currentId) {
        members[i] = members[i].copyWith(countNewMessage: 0);
      }
    }
    var lastMessage =
        currentId != room.messageNew?.idUserFrom ? room.messageNew : null;
    if (lastMessage != null) {
      lastMessage = lastMessage.copyWith(isRead: true);
    }
    roomRef.update(room.id, {
      'members': members.map((e) => e.toJson()).toList(),
      if (lastMessage != null) 'messageNew': lastMessage.toJson()
    });

    return MResult.success(room);
  }

  @override
  Future<MResult> updateLastTimeUpdate(String? id) {
    return roomRef.update(id, {'time': Timestamp.now()});
  }
}
