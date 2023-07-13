import 'package:photo_manager/photo_manager.dart';

import '../../../network/blob/model/upload_model.dart';
import '../../../network/model/common/result.dart';
// ignore: depend_on_referenced_packages

class ChatUploadService {
  static Future<MResult<MUpload>> uploadFile(
      String path, AssetType type) async {
    return MResult.error('Not implement api upload yet!');
  }

  static Future<MResult<MUpload>> uploadAssetFile(AssetEntity asset) async {
    final file = await asset.file;
    if (file != null) {
      return uploadFile(file.path, asset.type);
    }
    return MResult.error('File not found');
  }

  static Future<List<MResult<MUpload>>> uploadAssetFiles(
      List<AssetEntity> assets) {
    return Future.wait([for (final e in assets) uploadAssetFile(e)]);
  }
}
