import '../../../../network/model/common/result.dart';
import '../../../../network/model/user/user.dart';
import '../model/message/chat_message.dart';
import '../model/room/chat_room.dart';

abstract class ChatRoomRepository {
  Stream<List<MChatRoom>> getChatRoomsStream();
  Future<MResult<MChatRoom>> updateChatRoom(MChatRoom room);
  Future<MResult<MChatRoom>> readAllMessage(String userId, String roomId);
  Future<MResult<MChatRoom>> getChatRoomDetail(String id);
  Future<MResult<MChatRoom>> chatWithUser(MUser otherUser);
  Future<MResult> updateLastMessageForRoom(MChatMessage message);
}
