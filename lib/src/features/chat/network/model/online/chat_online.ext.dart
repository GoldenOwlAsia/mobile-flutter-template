part of 'chat_online.dart';

extension MChatOnlineExt on MChatOnline {
  bool get isOnline {
    return onlineAt.seconds > offlineAt.seconds;
  }
}
