import 'package:photo_manager/photo_manager.dart';

import '../../../src/localization/localization_utils.dart';

extension RequestTypeExt on RequestType {
  bool get image => this == RequestType.image;

  String get titleOf {
    if (this == RequestType.image) {
      return S.text.camera_choose_option_take_image;
    } else if (this == RequestType.video) {
      return S.text.camera_choose_option_take_video;
    }
    return '';
  }

  String get optionCameraOf {
    if (this == RequestType.image) {
      return S.text.camera_image_from_camera;
    } else if (this == RequestType.video) {
      return S.text.camera_video_from_camera;
    }
    return '';
  }

  String get optionGalleryOf {
    if (this == RequestType.image) {
      return S.text.camera_image_from_gallery;
    } else if (this == RequestType.video) {
      return S.text.camera_video_from_gallery;
    }
    return '';
  }
}

enum PickerFromType {
  camera,
  gallery;

  bool get isCamera => this == PickerFromType.camera;
  bool get isGallery => this == PickerFromType.gallery;
}
