// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:photo_manager/photo_manager.dart';
import '../../model/common/result.dart';
import '../model/upload_model.dart';
import 'upload_repository.dart';
import 'file_type_helper.dart';

class UploadRepositoryImpl extends UploadRepository {
  // Submit content must be image, video or audio
  Future<MResult<MUpload>> uploadFile(
    String path,
    http_parser.MediaType mediaType,
  ) async {
    return MResult.error('Not implement api upload yet!');
  }

  @override
  Future<MResult<MUpload>> uploadImage(String path) async {
    return uploadFile(path, FileTypeHelper.mediaTypeImage);
  }

  @override
  Future<MResult<MUpload>> uploadVideo(String path) async {
    return uploadFile(path, FileTypeHelper.mediaTypeVideo);
  }

  @override
  Future<List<MResult<MUpload>>> uploadImages(List<String> paths) {
    return Future.wait([for (final e in paths) uploadImage(e)]);
  }

  @override
  Future<List<MResult<MUpload>>> uploadVideos(List<String> paths) {
    return Future.wait([for (final e in paths) uploadVideo(e)]);
  }

  @override
  Future<MResult<MUpload>> uploadAssetFile(AssetEntity asset) async {
    final file = await asset.file;
    if (file != null) {
      http_parser.MediaType contentType =
          FileTypeHelper.mediaTypeFromAssetType(asset.type);
      return uploadFile(file.path, contentType);
    }
    return MResult.error('File not found');
  }

  @override
  Future<List<MResult<MUpload>>> uploadAssetFiles(List<AssetEntity> assets) {
    return Future.wait([for (final e in assets) uploadAssetFile(e)]);
  }
}
