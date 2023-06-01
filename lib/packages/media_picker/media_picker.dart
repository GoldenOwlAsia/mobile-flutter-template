// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../../src/dialogs/alert_wrapper.dart';
import '../../src/localization/localization_utils.dart';
import '../../src/router/coordinator.dart';
import 'choose_option_picker.dart';
import 'model/request_type.ext.dart';
import 'text_delegate/asset_picker_text_delegate.dart';
import 'text_delegate/camera_picker_text_delegate.dart';

class XMediaPicker {
  static BuildContext get context => AppCoordinator.context;

  static CameraPickerTextDelegate getCameraDelegateOf(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'th':
        return const ThailandCameraPickerTextDelegate();
      case 'vi':
        return const VietnameseCameraPickerTextDelegate();
      case 'fr':
        return const FranceCameraPickerTextDelegate();
      case 'ko':
        return const KoreaCameraPickerTextDelegate();
      case 'ja':
        return const JapanCameraPickerTextDelegate();
      default: // 'en
        return const EnglishCameraPickerTextDelegate();
    }
  }

  static AssetPickerTextDelegate getAssetsDelegateOf(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'th':
        return const ThailandAssetPickerTextDelegate();
      case 'vi':
        return const VietnameseAssetPickerTextDelegate();
      case 'fr':
        return const FranceAssetPickerTextDelegate();
      case 'ko':
        return const KoreaAssetPickerTextDelegate();
      case 'ja':
        return const JapanAssetPickerTextDelegate();
      default: // 'en
        return const EnglishAssetPickerTextDelegate();
    }
  }

  static Future<List<AssetEntity>?> onPickMultipleFromGalleryOrCamera(
      {RequestType requestType = RequestType.image, int maxAssets = 6}) async {
    PickerFromType? pickResult =
        await ChooseOptionPicker.show(context, requestType);
    if (pickResult == null) {
      return null;
    }
    if (pickResult.isCamera) {
      final asset = await pickOneFromCamera(
          enableRecording: requestType != RequestType.image,
          onlyEnableRecording: requestType == RequestType.video);
      return asset != null ? [asset] : null;
    } else {
      return pickMultipleFromAssets(
          requestType: requestType, maxAssets: maxAssets);
    }
  }

  // Support Image or Video
  static Future<AssetEntity?> onPickOneFromGalleryOrCamera(
      [RequestType requestType = RequestType.image]) async {
    PickerFromType? pickResult =
        await ChooseOptionPicker.show(context, requestType);
    if (pickResult == null) {
      return null;
    }
    return pickResult.isCamera
        ? await pickOneFromCamera(
            enableRecording: requestType != RequestType.image,
            onlyEnableRecording: requestType == RequestType.video)
        : await pickOneFromAssets(requestType: requestType);
  }

  static Future<AssetEntity?> pickOneFromCamera({
    bool enableRecording = false,
    bool onlyEnableRecording = false,
  }) async {
    if (await checkCameraPermission() == false) {
      return null;
    }
    return CameraPicker.pickFromCamera(
      context,
      pickerConfig: CameraPickerConfig(
        enableRecording: true,
        onlyEnableRecording: false,
        textDelegate: getCameraDelegateOf(context),
      ),
    );
  }

  static Future<List<AssetEntity>?> pickMultipleFromAssets(
      {RequestType requestType = RequestType.common, int maxAssets = 6}) async {
    if (await checkGalleryPermission() == false) {
      return null;
    }
    return AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        requestType: requestType,
        maxAssets: maxAssets,
        textDelegate: getAssetsDelegateOf(context),
      ),
    );
  }

  static Future<AssetEntity?> pickOneFromAssets(
      {RequestType requestType = RequestType.common}) async {
    if (await checkGalleryPermission() == false) {
      return null;
    }
    final List<AssetEntity>? assets =
        await pickMultipleFromAssets(requestType: requestType, maxAssets: 1);
    if (assets?.isNotEmpty == true) {
      return assets?.first;
    }
    return null;
  }

  static Future<bool> checkGalleryPermission({bool openSetting = true}) async {
    var status = await Permission.storage.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      if (openSetting) {
        final confirmOpen = await XAlert.showConfirmDialog(
          S.text.common_gallery_request_title,
          S.text.common_gallery_request_content,
        );
        if (confirmOpen == true) {
          openAppSettings();
        }
      }
      return false;
    }
    return true;
  }

  static Future<bool> checkCameraPermission({bool openSetting = true}) async {
    var status = await Permission.camera.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      if (openSetting) {
        final confirmOpen = await XAlert.showConfirmDialog(
            S.text.common_camera_request_title,
            S.text.common_camera_request_content,);
        if (confirmOpen == true) {
          openAppSettings();
        }
      }
      return false;
    }
    return true;
  }
}
