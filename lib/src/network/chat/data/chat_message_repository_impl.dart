import '../../firestore/chat/chat_message_reference.dart';
import '../../model/common/result.dart';
import '../model/message/chat_message.dart';
import 'chat_message_repository.dart';

class ChatMessageRepositoryImpl extends ChatMessageRepository {
  @override
  Stream<MChatMessage?> getMessageStream(String idChatRoom, String id) {
    final provider = ChatMessageReference(idChatRoom);
    return provider.snapshots(id).map((e) => e.data());
  }

  @override
  Future<Stream<List<MChatMessage>>> getHistoryFromIdStream(
      String idChatRoom, String idLastDoc, int limit) {
    final provider = ChatMessageReference(idChatRoom);
    return provider.getHistoryFromIdStream(idChatRoom, idLastDoc, limit);
  }

  @override
  Future<Stream<List<MChatMessage>>> getNewMessageFromIdStream(
      String idChatRoom, String? idLastDoc) {
    final provider = ChatMessageReference(idChatRoom);
    return provider.getNewMessageFromIdStream(idChatRoom, idLastDoc);
  }

  @override
  Future<MResult<MChatMessage>> saveMessage(MChatMessage item) {
    final provider = ChatMessageReference(item.idChatRoom);
    return provider.set(item);
  }
}
