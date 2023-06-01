import '../../model/common/result.dart';
import '../model/message/chat_message.dart';

abstract class ChatMessageRepository {
  Stream<MChatMessage?> getMessageStream(String idChatRoom, String id);

  Future<Stream<List<MChatMessage>>> getNewMessageFromIdStream(
      String idChatRoom, String? idLastDoc);

  Future<Stream<List<MChatMessage>>> getHistoryFromIdStream(
      String idChatRoom, String idLastDoc, int limit);

  Future<MResult<MChatMessage>> saveMessage(MChatMessage item);
}
