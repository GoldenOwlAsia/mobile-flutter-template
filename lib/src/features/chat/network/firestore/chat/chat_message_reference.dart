import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/message/chat_message.dart';
import '../../../../../network/firebase/base_collection.dart';
import '../collection_keys.dart';

class ChatMessageReference extends BaseCollectionReference<MChatMessage> {
  ChatMessageReference(this.roomChat)
      : super(
          FirebaseFirestore.instance
              .collection(CollectionKeys.messagesOf(roomChat))
              .withConverter<MChatMessage>(
                fromFirestore: (snapshot, _) => MChatMessage.fromJsonDocument(
                    snapshot.data() as Map<String, dynamic>, snapshot.id),
                toFirestore: (message, _) => message.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );
  final String roomChat;

  Future<DocumentSnapshot<MChatMessage>?> _getLastDoc(String id) async {
    try {
      return ref.doc(id).get();
    } catch (e) {
      return null;
    }
  }

  Future<Stream<List<MChatMessage>>> getNewMessageFromIdStream(
    String idChatRoom,
    String? idLastDoc,
  ) async {
    DocumentSnapshot<MChatMessage>? lastDoc;
    Query<MChatMessage> queryChat = ref.orderBy(
      FieldKeys.createdAt,
      descending: true,
    );
    if (idLastDoc != null) {
      lastDoc = await _getLastDoc(idLastDoc);
    }
    if (lastDoc?.exists == true) {
      queryChat = queryChat.endBeforeDocument(lastDoc!);
    }

    return queryChat.snapshots().map((event) {
      List<MChatMessage> data = event.docs.map((e) => e.data()).toList();
      return data;
    });
  }

  Future<Stream<List<MChatMessage>>> getHistoryFromIdStream(
    String idChatRoom,
    String idLastDoc,
    int limit,
  ) async {
    Query<MChatMessage> queryChat = ref.orderBy(
      FieldKeys.createdAt,
      descending: true,
    );
    final lastDoc = await _getLastDoc(idLastDoc);
    if (lastDoc?.exists == true) {
      queryChat = queryChat.startAtDocument(lastDoc!);
    }

    return queryChat.limit(limit).snapshots().map((event) {
      List<MChatMessage> data = event.docs.map((e) => e.data()).toList();
      return data;
    });
  }
}
