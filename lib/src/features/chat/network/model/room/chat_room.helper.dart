import 'package:cloud_firestore/cloud_firestore.dart';

class MChatRoomHelper {
  static String idChatRoomOf(String a, String b) {
    final text = a.compareTo(b) == 1 ? '$a+$b' : '$b+$a';
    return 'chatroom+$text';
  }

  static String idChatMessageOf(String userId) {
    final id = Timestamp.now().millisecondsSinceEpoch;
    return 'message+$id+$userId';
  }
}
