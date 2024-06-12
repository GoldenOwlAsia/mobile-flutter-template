import 'package:myapp/src/core/blob/model/upload_model.dart';
import 'package:myapp/src/core/resources/data_state.dart';

abstract class UploadRepository {
  Future<DataState<MUpload?>> uploadImage(String path);

  Future<DataState<MUpload?>> uploadVideo(String path);

  Future<List<DataState<MUpload>>> uploadVideos(List<String> paths);

  Future<List<DataState<MUpload>>> uploadImages(List<String> paths);
}
