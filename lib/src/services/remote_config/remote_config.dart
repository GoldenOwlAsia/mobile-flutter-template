import 'package:myapp/src/config/devices/app_Info.dart';
import 'package:version/version.dart';

class RemoteConfig {
  // force_update_version
  final Version forceVersion;
  RemoteConfig({
    required this.forceVersion,
  });

  factory RemoteConfig.ds() {
    return RemoteConfig(forceVersion: Version.parse(AppInfo.package.version));
  }

  bool get needForceUpdate {
    final currentVersion = Version.parse(AppInfo.package.version);
    return currentVersion < forceVersion;
  }

  factory RemoteConfig.fromConfig(String versionString) {
    final version = Version.parse(versionString);
    return RemoteConfig(forceVersion: version);
  }
}
