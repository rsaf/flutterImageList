import 'package:xiang_flutter/services/request/request_service.dart';
import 'package:xiang_flutter/services/storage/storage_service.dart';
import 'package:xiang_flutter/services/toast/toast_service.dart';
import 'package:xiang_flutter/services/progress_loading/progress_loading.dart';
import 'dart:typed_data';
import 'dart:async';

class GlobalServiceCenter with UserProvidable {
  static RequestService request = RequestService.shared;
  static StorageService storage = StorageService.shared;
  static ToastService toast = ToastService.shared;
  static LoadingService loading = LoadingService.shared;
}

enum UploadType { image, video }

class UploadItem {
  String identifier;
  Uint8List data;
  UploadType type;
  String finalPath;
  String filePath;

  UploadItem(this.data, this.type, {this.identifier, this.filePath});
}

mixin UserProvidable {}
