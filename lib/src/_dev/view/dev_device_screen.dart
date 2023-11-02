import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../config/devices/app_info.dart';
import '../widget/dev_copy_title.dart';
import '../widget/dev_screen_layout.dart';
import '../widget/dev_title.dart';

class DevDeviceScreen extends StatelessWidget {
  const DevDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceInfo device = AppInfo.device;
    PackageInfo package = AppInfo.package;
    return DevScreenLayout(
      'Device',
      children: [
        const DevTitle('Device Info'),
        DevCopyTitle('Device UID', device.uid),
        DevCopyTitle('Device Name', device.name),
        DevCopyTitle('Device Platform Name', device.platformName),
        DevCopyTitle('Device Version', device.platformVersion),
        DevCopyTitle('Device Model', device.model),
        const DevTitle('Package Info'),
        DevCopyTitle('App Name', package.appName),
        DevCopyTitle('Package Name', package.packageName),
        DevCopyTitle('Version', '${package.version} +${package.buildNumber}'),
        DevCopyTitle('Build Signature', package.buildSignature),
      ],
    );
  }
}
