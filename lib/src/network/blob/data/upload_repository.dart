import '../../model/common/result.dart';
import '../model/upload_model.dart';

abstract class UploadRepository {
  Future<MResult<MUpload?>> uploadImage(String path);
  Future<MResult<MUpload?>> uploadVideo(String path);
  Future<List<MResult<MUpload>>> uploadVideos(List<String> paths);
  Future<List<MResult<MUpload>>> uploadImages(List<String> paths);
}
