import '../../../../network/model/common/result.dart';
import '../model/message/chat_message.dart';

abstract class ChatMessageRepository {
  Future<Stream<List<MChatMessage>>> getNewMessageFromIdStream(
      String idChatRoom, String? idLastDoc);

  Future<Stream<List<MChatMessage>>> getHistoryFromIdStream(
      String idChatRoom, String idLastDoc, int limit);

  // Send new message
  Future<MResult<MChatMessage>> sendMessage(MChatMessage message);

  Future<MResult> deleteMessage(String roomID, String id);
  Future<bool> setReadForHistory(List<MChatMessage> historyList, String userId);
  Future<MResult> updateReadMessage(MChatMessage message);
  Future<MResult> updateReactionList(MChatMessage message);
}
