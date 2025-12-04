import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:injectable/injectable.dart';
import 'package:myapp/src/network/blob/data/upload_repository.dart';
import 'package:myapp/src/network/blob/model/upload_model.dart';
import 'package:myapp/src/network/model/common/result.dart';

@Injectable(as: UploadRepository)
class UploadRepositoryImpl extends UploadRepository {
  // Submit content must be image, video or audio
  Future<MResult<MUpload?>> uploadFile(
    String path,
    http_parser.MediaType mediaType,
  ) async {
    return MResult.error('Not implement api upload yet!');
  }

  @override
  Future<MResult<MUpload?>> uploadImage(String path) async {
    return uploadFile(path, http_parser.MediaType('image', 'png'));
  }

  @override
  Future<MResult<MUpload?>> uploadVideo(String path) async {
    return uploadFile(path, http_parser.MediaType('video', 'mp4'));
  }

  @override
  Future<List<MResult<MUpload>>> uploadImages(List<String> paths) async {
    final results = await Future.wait([for (final e in paths) uploadImage(e)]);
    return results.map((result) {
      if (result.isSuccess && result.data != null) {
        return MResult.success(result.data!);
      }
      return MResult<MUpload>.error(result.error);
    }).toList();
  }

  @override
  Future<List<MResult<MUpload>>> uploadVideos(List<String> paths) async {
    final results = await Future.wait([for (final e in paths) uploadVideo(e)]);
    return results.map((result) {
      if (result.isSuccess && result.data != null) {
        return MResult.success(result.data!);
      }
      return MResult<MUpload>.error(result.error);
    }).toList();
  }
}
