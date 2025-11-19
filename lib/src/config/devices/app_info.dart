import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/src/utils/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static late DeviceInfo device;
  static late PackageInfo package;

  static Future<void> initialize() async {
    await Future.wait([
      loadDevice(),
      loadPackage(),
    ]);
  }

  static Future<void> loadDevice() async {
    try {
      final DeviceInfoPlugin plugin = DeviceInfoPlugin();
      if (kIsWeb) {
        final WebBrowserInfo info = await plugin.webBrowserInfo;
        device = DeviceInfo(
          platformName: info.platform ?? 'Web',
          platformVersion: info.appVersion ?? 'Unknown',
          uid: info.appCodeName ?? 'Unknown',
          name: info.appName ?? 'Unknown',
          model: info.product ?? 'Unknown',
          isPhysicalDevice: true,
        );
      } else if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await plugin.androidInfo;
        device = DeviceInfo(
          platformName: info.version.baseOS?.isNotEmpty == true
              ? info.version.baseOS!
              : 'Android',
          platformVersion: info.version.release,
          uid: info.id,
          name: info.device,
          model: info.model,
          isPhysicalDevice: info.isPhysicalDevice,
        );
      } else if (Platform.isIOS) {
        final IosDeviceInfo info = await plugin.iosInfo;
        device = DeviceInfo(
          platformName: info.systemName,
          platformVersion: info.systemVersion,
          uid: info.identifierForVendor ?? 'Unknown',
          name: info.name,
          model: info.model,
          isPhysicalDevice: info.isPhysicalDevice,
        );
      } else {
        // Fallback for unsupported platforms (macOS, Windows, Linux)
        xLog.w('Unsupported platform detected');
        device = DeviceInfo(
          platformName: Platform.operatingSystem,
          platformVersion: Platform.operatingSystemVersion,
        );
      }
    } catch (e, stackTrace) {
      xLog.e('Error loading device info', error: e, stackTrace: stackTrace);
      device = DeviceInfo();
    }
  }

  static Future<void> loadPackage() async {
    package = await PackageInfo.fromPlatform();
  }
}

class DeviceInfo {
  final String? uid;
  final String? name;
  final String? platformName;
  final String? platformVersion;
  final String? model;
  final bool isPhysicalDevice;

  DeviceInfo({
    this.isPhysicalDevice = true,
    this.uid,
    this.name,
    this.platformName,
    this.platformVersion,
    this.model,
  });

  DeviceInfo copyWith({
    String? uid,
    String? name,
    String? platformName,
    String? platformVersion,
    String? model,
    bool? isPhysicalDevice,
  }) {
    return DeviceInfo(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      platformName: platformName ?? this.platformName,
      platformVersion: platformVersion ?? this.platformVersion,
      model: model ?? this.model,
      isPhysicalDevice: isPhysicalDevice ?? this.isPhysicalDevice,
    );
  }

  @override
  String toString() {
    return 'DeviceInfo(uid: $uid, name: $name, platformName: $platformName, '
        'platformVersion: $platformVersion, model: $model, '
        'isPhysicalDevice: $isPhysicalDevice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeviceInfo &&
        other.uid == uid &&
        other.name == name &&
        other.platformName == platformName &&
        other.platformVersion == platformVersion &&
        other.model == model &&
        other.isPhysicalDevice == isPhysicalDevice;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        platformName.hashCode ^
        platformVersion.hashCode ^
        model.hashCode ^
        isPhysicalDevice.hashCode;
  }
}
