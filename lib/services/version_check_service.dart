import 'package:package_info_plus/package_info_plus.dart';

class VersionCheckService {
  Future<String> getCurrentVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  Future<String> getBuildNumber() async {
    final info = await PackageInfo.fromPlatform();
    return info.buildNumber;
  }
}
