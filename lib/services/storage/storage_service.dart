import 'package:xiang_flutter/services/storage/son_storage.dart';
import 'package:xiang_flutter/services/storage/god_storage.dart';
import 'package:xiang_flutter/config/global_config.dart';
import 'dart:async';

class StorageService {
  static StorageService shared = StorageService();
  factory StorageService() =>
      GlobalConfig.isSonMode ? SonStorageService() : GodStorageService();

  save<T>(String key, T element) async {
    throw UnimplementedError("saveElement 方法木有实现哦");
  }

  Future<T> fetch<T>(String key) async {
    throw UnimplementedError("fetch 方法木有实现哦");
  }

  Future<String> fetchString(String key) async {
    throw UnimplementedError("fetchString 方法木有实现哦");
  }
}
