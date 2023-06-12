import '../../../../network/model/common/result.dart';
import '../model/online/chat_online.dart';

abstract class ChatOnlineRepository {
  Future<MResult<MChatOnline>> setOnline();
  Future<MResult<MChatOnline>> setOffline([String? userId]);
  Future<MResult<MChatOnline>> getOnline(String id);
  Stream<MChatOnline?> snapshotOnlineStream(String id);
  Stream<List<MChatOnline>> snapshotMultipleOnlineStream(List<String> ids);
}
