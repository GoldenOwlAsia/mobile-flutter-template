import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

class RemoteConfig {
  // force_update_version
  final Version forceVersion;
  RemoteConfig({
    required this.forceVersion,
  });

  factory RemoteConfig.ds() {
    return RemoteConfig(forceVersion: Version.parse('0.0.0'));
  }

  Future<bool> needForceUpdate() async {
    final package = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(package.version);
    return currentVersion < forceVersion;
  }

  factory RemoteConfig.fromConfig(String versionString) {
    final version = Version.parse(versionString);
    return RemoteConfig(forceVersion: version);
  }
}
