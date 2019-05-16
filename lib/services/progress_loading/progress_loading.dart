import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xiang_flutter/config/global_config.dart';
import 'package:xiang_flutter/bridge.dart';

class LoadingService {
  static LoadingService shared = LoadingService();
  factory LoadingService() =>
      GlobalConfig.isSonMode ? SonLoadingService() : GodLoadingService();

  Future<void> toggleLoading(bool isLoading) async {
    throw UnimplementedError("loading 方法木有实现哦");
  }
}

class GodLoadingService implements LoadingService {
  Future<void> toggleLoading(bool isLoading) async {
    print('loading');
  }

}

class SonLoadingService implements LoadingService {
  Future<void> toggleLoading(bool isLoading) async {
    await BridgeManager.call("loading", {'show' : isLoading});
  }
}
