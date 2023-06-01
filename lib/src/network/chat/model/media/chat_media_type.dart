part of '../message/chat_message.dart';

enum MChatMediaType { other, image, video, audio }

extension MChatMediaTypeExt on MChatMediaType {
  static MChatMediaType fromAssetType(AssetType assetType) {
    switch (assetType) {
      case AssetType.other:
        return MChatMediaType.other;
      case AssetType.image:
        return MChatMediaType.image;
      case AssetType.video:
        return MChatMediaType.video;
      case AssetType.audio:
        return MChatMediaType.audio;
    }
  }
}
