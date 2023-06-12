// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../json_converter/timestamp_converter.dart';

part 'chat_online.freezed.dart';
part 'chat_online.g.dart';
part 'chat_online.ext.dart';

@freezed
class MChatOnline with _$MChatOnline {
  const factory MChatOnline({
    required String id,
    @TimestampConverter() required Timestamp onlineAt,
    @TimestampConverter() required Timestamp offlineAt,
  }) = _MChatOnline;

  factory MChatOnline.fromJson(Map<String, Object?> json) =>
      _$MChatOnlineFromJson(json);

  factory MChatOnline.fromJsonDocument(Map<String, Object?> json, String id) {
    json['id'] = id;
    return MChatOnline.fromJson(json);
  }
  factory MChatOnline.online(String id) {
    return MChatOnline(
        id: id,
        onlineAt: Timestamp.now(),
        offlineAt: Timestamp.fromDate(
            DateTime.now().subtract(const Duration(minutes: 1))));
  }
  factory MChatOnline.offline(String id) {
    return MChatOnline(
        id: id,
        offlineAt: Timestamp.now(),
        onlineAt: Timestamp.fromDate(
            DateTime.now().subtract(const Duration(minutes: 1))));
  }
}
