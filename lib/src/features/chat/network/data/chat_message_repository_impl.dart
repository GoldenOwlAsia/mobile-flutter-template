import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../network/model/common/result.dart';
import '../chat_domain.dart';
import '../firestore/chat/chat_message_reference.dart';
import '../model/message/chat_message.dart';
import 'chat_message_repository.dart';

class ChatMessageRepositoryImpl extends ChatMessageRepository {
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
  Future<MResult> deleteMessage(String roomID, String id) {
    final provider = ChatMessageReference(roomID);
    return provider.delete(id);
  }

  @override
  Future<MResult<MChatMessage>> sendMessage(MChatMessage message) async {
    final provider = ChatMessageReference(message.idChatRoom);
    final result = await provider.set(message);
    //
    ChatDomainManager().chatRoom.updateLastMessage(message);
    return result;
  }

  @override
  Future<bool> setReadForHistory(
      List<MChatMessage> historyList, String userId) async {
    if (historyList.isEmpty) {
      return false;
    }
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    final provider = ChatMessageReference(historyList[0].idChatRoom);
    for (var e in historyList) {
      if (e.isRead == false && e.idUserFrom != userId) {
        final doc = provider.ref.doc(e.id);
        batch.update(doc, {'isRead': true});
      }
    }
    await batch.commit();
    return true;
  }

  @override
  Future<MResult> updateReactionList(MChatMessage message) {
    final provider = ChatMessageReference(message.idChatRoom);
    return provider.update(message.id, {
      'reactions': message.reactions.map((e) => e.toJson()).toList(),
    });
  }

  @override
  Future<MResult> updateReadMessage(MChatMessage message) {
    final provider = ChatMessageReference(message.idChatRoom);
    return provider.update(message.id, {'isRead': true});
  }
}
