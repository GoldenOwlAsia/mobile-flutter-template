import 'package:photo_manager/photo_manager.dart';
import '../../model/common/result.dart';
import '../model/blob_model.dart';

abstract class BlobRepository {
  Future<MResult<MBlob?>> uploadImage(String path);
  Future<MResult<MBlob?>> uploadVideo(String path);
  Future<List<MResult<MBlob>>> uploadAssetFiles(List<AssetEntity> assets);
  Future<List<MResult<MBlob>>> uploadVideos(List<String> paths);
  Future<List<MResult<MBlob>>> uploadImages(List<String> paths);
  Future<MResult<MBlob>> uploadAssetFile(AssetEntity asset);
}
