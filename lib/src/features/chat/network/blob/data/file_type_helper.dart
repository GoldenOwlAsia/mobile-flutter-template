// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:photo_manager/photo_manager.dart';

class FileTypeHelper {
  static http_parser.MediaType mediaTypeImage =
      http_parser.MediaType('image', 'png');
  static final mediaTypeVideo = http_parser.MediaType('video', 'mp4');
  static final mediaTypeAudio = http_parser.MediaType('audio', 'mp3');
  static final mediaTypeFile = http_parser.MediaType('file', '');

  static http_parser.MediaType mediaTypeFromAssetType(AssetType type) {
    switch (type) {
      case AssetType.other:
        return mediaTypeFile;
      case AssetType.image:
        return mediaTypeImage;
      case AssetType.video:
        return mediaTypeVideo;
      case AssetType.audio:
        return mediaTypeAudio;
    }
  }

  static String? getFileExtension(String path) {
    try {
      return path.split('.').last;
    } catch (e) {
      return null;
    }
  }
}
