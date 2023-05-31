// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

import '../message/chat_message.dart';

part 'chat_media.freezed.dart';
part 'chat_media.g.dart';
part 'chat_media.ext.dart';

@freezed
class MChatMedia with _$MChatMedia {
  const factory MChatMedia({
    @Default('') String url,
    @Default(MChatMediaType.image) MChatMediaType fileType,
    int? duration,
    int? width,
    int? height,
    int? orientation,
  }) = _MChatMedia;

  factory MChatMedia.fromJson(Map<String, Object?> json) =>
      _$MChatMediaFromJson(json);

  factory MChatMedia.fromAsset(AssetEntity asset, String url) {
    return MChatMedia(
      url: url,
      fileType: MChatMediaTypeExt.fromAssetType(asset.type),
      width: asset.width,
      height: asset.height,
      duration: asset.duration,
      orientation: asset.orientation,
    );
  }

  ///  * [videoDuration] which is a duration getter for videos.
  /// in second
  // final int duration;

  /// The width of the asset.
  ///
  /// This field could be 0 in cases that EXIF info is failed to parse.
  // final int width;

  /// The height of the asset.
  ///
  /// This field could be 0 in cases that EXIF info is failed to parse.
  // final int height;

  /// The orientation of the asset.
  ///  * Android: `MediaStore.MediaColumns.ORIENTATION`,
  ///    could be 0, 90, 180, 270.
  ///  * iOS/macOS: Always 0.
  // final int orientation;
}
