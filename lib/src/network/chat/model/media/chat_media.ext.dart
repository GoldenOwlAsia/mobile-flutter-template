part of 'chat_media.dart';

extension MChatMediaExt on MChatMedia {
  bool get noHasSize =>
      height == null || width == null || height == 0.0 || width == 0.0;
}
