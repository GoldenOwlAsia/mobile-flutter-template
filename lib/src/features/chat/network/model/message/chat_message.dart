import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linkify/linkify.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import '../../../../../localization/localization_utils.dart';
import '../../json_converter/timestamp_converter.dart';
import '../media/chat_media.dart';
import '../reaction/chat_reaction.dart';
import '../room/chat_room.helper.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';
part 'chat_message.ext.dart';
part '../media/chat_media_type.dart';

@freezed
class MChatMessage with _$MChatMessage {
  const factory MChatMessage({
    required String id,
    @Default('') String content,
    MChatMessage? messageReply,
    @Default('') String idUserFrom,
    @Default('') String idChatRoom,
    @Default([]) List<MChatMedia> medias,
    @Default([]) List<MChatReaction> reactions,
    @Default(false) bool isRead,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _MChatMessage;

  factory MChatMessage.fromJson(Map<String, Object?> json) =>
      _$MChatMessageFromJson(json);

  factory MChatMessage.fromJsonDocument(Map<String, Object?> json, String id) {
    json['id'] = id;
    return MChatMessage.fromJson(json);
  }
  factory MChatMessage.empty() {
    return MChatMessage(
      id: '',
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    );
  }

  factory MChatMessage.newTextMessage(
    String text,
    String idUserFrom,
    String idChatRoom, {
    MChatMessage? messageReply,
  }) {
    final time = Timestamp.now();
    return MChatMessage(
      id: MChatRoomHelper.idChatMessageOf(idUserFrom),
      content: text,
      createdAt: time,
      updatedAt: time,
      messageReply: messageReply,
      idUserFrom: idUserFrom,
      idChatRoom: idChatRoom,
      medias: [],
    );
  }

  factory MChatMessage.newMediaMessage(
    List<MChatMedia> medias,
    String idUserFrom,
    String idChatRoom, {
    MChatMessage? messageReply,
    String audio = '',
  }) {
    final time = Timestamp.now();
    return MChatMessage(
      id: MChatRoomHelper.idChatMessageOf(idUserFrom),
      medias: medias,
      createdAt: time,
      updatedAt: time,
      messageReply: messageReply,
      idUserFrom: idUserFrom,
      idChatRoom: idChatRoom,
    );
  }
  factory MChatMessage.newLocationMessage(
    String idUserFrom,
    String idChatRoom, {
    MChatMessage? messageReply,
  }) {
    final time = Timestamp.now();
    return MChatMessage(
      id: MChatRoomHelper.idChatMessageOf(idUserFrom),
      createdAt: time,
      updatedAt: time,
      messageReply: messageReply,
      idUserFrom: idUserFrom,
      idChatRoom: idChatRoom,
      medias: [],
    );
  }
}
