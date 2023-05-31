// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:photo_manager/photo_manager.dart';
import '../../model/common/result.dart';
import '../model/blob_model.dart';
import 'blob_repository.dart';
import 'file_type_helper.dart';

class BlobRepositoryImpl extends BlobRepository {
  // Submit content must be image, video or audio
  Future<MResult<MBlob>> uploadFile(
    String path,
    http_parser.MediaType mediaType,
  ) async {
    return MResult.error('Not implement api upload yet!');
  }

  @override
  Future<MResult<MBlob>> uploadImage(String path) async {
    return uploadFile(path, FileTypeHelper.mediaTypeImage);
  }

  @override
  Future<MResult<MBlob>> uploadVideo(String path) async {
    return uploadFile(path, FileTypeHelper.mediaTypeVideo);
  }

  @override
  Future<List<MResult<MBlob>>> uploadImages(List<String> paths) {
    return Future.wait([for (final e in paths) uploadImage(e)]);
  }

  @override
  Future<List<MResult<MBlob>>> uploadVideos(List<String> paths) {
    return Future.wait([for (final e in paths) uploadVideo(e)]);
  }

  @override
  Future<MResult<MBlob>> uploadAssetFile(AssetEntity asset) async {
    final file = await asset.file;
    if (file != null) {
      http_parser.MediaType contentType =
          FileTypeHelper.mediaTypeFromAssetType(asset.type);
      return uploadFile(file.path, contentType);
    }
    return MResult.error('File not found');
  }

  @override
  Future<List<MResult<MBlob>>> uploadAssetFiles(List<AssetEntity> assets) {
    return Future.wait([for (final e in assets) uploadAssetFile(e)]);
  }
}
