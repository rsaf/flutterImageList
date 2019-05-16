import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';
import 'package:xiang_flutter/utils/utils.dart';
import 'dart:io' show Platform;
import 'dart:async';

class GlobalConfig {
  static bool get isSonMode {
    return sonMode;
  }

  static bool get isAndroid {
    return Platform.isAndroid;
  }

  static bool sonMode = !Util.isDebugMode;
}

class AppInfo {
  String appName;
  String version;
  String buildNumber;

  AppInfo(this.appName, this.version, this.buildNumber);
}

class DeviceInfo {
  String identifier;
  String device;
  String osSystem;
  String brand;

  DeviceInfo(this.device, this.osSystem, this.brand, this.identifier);
}

class Doraemon {
  static Doraemon shared = Doraemon();

  AppInfo _cachedAppInfo;
  DeviceInfo _cachedDeviceInfo;

  static const String wxAppId = "wxc4876d0a30c067c6";
  static const String wxMiniProgramId = 'gh_ff07d6a341b5';

  Future<AppInfo> get appInfo async {
    // 如果之前取过就直接获取了
    if (_cachedAppInfo != null) {
      return Future.value(_cachedAppInfo);
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AppInfo info = AppInfo(
        packageInfo.appName, packageInfo.version, packageInfo.buildNumber);
    _cachedAppInfo = info;
    return info;
  }

  Future<DeviceInfo> get deviceInfo async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    DeviceInfo info;

    // 如果之前取过就直接获取了
    if (_cachedDeviceInfo != null) {
      return Future.value(_cachedDeviceInfo);
    }

    if (GlobalConfig.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      info = DeviceInfo(androidInfo.device, androidInfo.version.baseOS,
          androidInfo.brand, androidInfo.id);
    } else {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      info = DeviceInfo(iosInfo.model, iosInfo.systemVersion, "Apple",
          iosInfo.identifierForVendor);
    }

    _cachedDeviceInfo = info;
    return info;
  }
}
