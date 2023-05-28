import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp json) {
    return json;
  }

  @override
  Timestamp toJson(Timestamp object) {
    return object;
  }
}
