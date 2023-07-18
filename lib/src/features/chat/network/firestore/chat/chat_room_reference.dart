import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/network/firebase/base_collection.dart';
import 'package:myapp/src/features/chat/network/firestore/collection_keys.dart';
import '../../../../account/logic/account_bloc.dart';
import '../../model/member/chat_member.dart';
import '../../model/room/chat_room.dart';
import '../../model/room/chat_room.helper.dart';
import '../../../../../network/model/common/result.dart';
import '../../../../../network/model/user/user.dart';

class ChatRoomReference extends BaseCollectionReference<MChatRoom> {
  ChatRoomReference()
      : super(
          FirebaseFirestore.instance
              .collection(CollectionKeys.chatRooms)
              .withConverter<MChatRoom>(
                fromFirestore: (snapshot, options) =>
                    MChatRoom.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Stream<List<MChatRoom>> getChatRoomsStream() {
    try {
      final String id = GetIt.I<AccountBloc>().state.user.id;
      if (id.isEmpty) {
        return const Stream.empty();
      }
      Query<MChatRoom> queryChat = ref
          .where(FieldKeys.userIds, arrayContains: id)
          .orderBy(FieldKeys.updatedAt, descending: true);
      return queryChat.snapshots().map((event) {
        final result = event.docs.map((e) => e.data()).toList();
        return result;
      });
    } catch (e) {
      debugPrint('$e');
      return const Stream.empty();
    }
  }

  Future<MResult<MChatRoom>> getAndUpdateChatRoomWithUser(
      MUser user, MUser otherUser) async {
    try {
      final roomId = MChatRoomHelper.idChatRoomOf(otherUser.id, user.id);
      final DocumentSnapshot<MChatRoom> doc = await ref.doc(roomId).get();
      final members = [
        MChatMember.fromUser(user),
        MChatMember.fromUser(otherUser),
      ];
      if (doc.exists) {
        // update new data chatroom
        MChatRoom room = doc.data() ?? MChatRoom.empty(roomId);
        room = room.copyWith(members: members);
        return set(room);
      } else {
        // create new chatroom
        MChatRoom room = MChatRoom(
          id: roomId,
          updatedAt: Timestamp.now(),
          createdAt: Timestamp.now(),
          members: members,
          userIds: members.map((e) => e.id).toList(),
        );
        return set(room);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
