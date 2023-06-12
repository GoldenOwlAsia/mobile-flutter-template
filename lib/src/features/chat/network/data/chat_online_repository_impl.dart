import '../../../../network/model/common/result.dart';
import '../firestore/chat/chat_online_reference.dart';
import '../model/online/chat_online.dart';
import 'chat_online_repository.dart';

class ChatOnlineRepositoryImpl extends ChatOnlineRepository {
  final ChatOnlineReference _ref = ChatOnlineReference();
  @override
  Future<MResult<MChatOnline>> getOnline(String id) {
    return _ref.get(id);
  }

  @override
  Future<MResult<MChatOnline>> setOffline([String? userId]) {
    return _ref.setOffline(userId);
  }

  @override
  Future<MResult<MChatOnline>> setOnline() {
    return _ref.setOnline();
  }

  @override
  Stream<List<MChatOnline>> snapshotMultipleOnlineStream(List<String> ids) {
    return _ref.listenMultipleUser(ids);
  }

  @override
  Stream<MChatOnline?> snapshotOnlineStream(String id) {
    return _ref.snapshots(id).map((e) => e.data());
  }
}
