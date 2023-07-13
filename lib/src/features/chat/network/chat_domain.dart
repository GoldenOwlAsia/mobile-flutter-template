import 'data/chat_message_repository_impl.dart';
import 'data/chat_online_repository_impl.dart';
import 'data/chat_room_repository_impl.dart';

class ChatDomainManager {
  factory ChatDomainManager() {
    _internal ??= ChatDomainManager._();
    return _internal!;
  }
  ChatDomainManager._();
  static ChatDomainManager? _internal;

  final chatRoom = ChatRoomRepositoryImpl();
  final chatMessage = ChatMessageRepositoryImpl();
  final chatOnline = ChatOnlineRepositoryImpl();
}
