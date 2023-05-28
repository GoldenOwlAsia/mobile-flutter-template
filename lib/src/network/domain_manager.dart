import 'package:myapp/src/network/data/sign/sign_repository_impl.dart';

import 'blob/data/blob_repository_impl.dart';
import 'chat/data/chat_message_repository_impl.dart';
import 'chat/data/chat_online_repository_impl.dart';
import 'chat/data/chat_room_repository_impl.dart';
import 'data/user/user_repository_impl.dart';

class DomainManager {
  factory DomainManager() {
    _internal ??= DomainManager._();
    return _internal!;
  }
  DomainManager._();
  static DomainManager? _internal;

  final user = UserRepositoryImpl();
  final sign = SignRepositoryImpl();
  final chatRoom = ChatRoomRepositoryImpl();
  final chatMessage = ChatMessageRepositoryImpl();
  final chatOnline = ChatOnlineRepositoryImpl();
  final blob = BlobRepositoryImpl();
}
