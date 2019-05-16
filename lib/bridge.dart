import 'package:flutter/services.dart';
import 'dart:async';
import 'package:xiang_flutter/services/request/request_exception.dart';

class BridgeManager {
  static const MethodChannel sharedMethodChannel =
      MethodChannel('xiang.flutter.common/shared');

  static const EventChannel sharedEventChannel = EventChannel('xiang.flutter.common/shared_event');

  static Future<String> call(
      String method, Map<String, dynamic> arguments) async {
    try {
      final String result =
          await sharedMethodChannel.invokeMethod(method, arguments);
      return result;
    } on PlatformException catch (err) {
      print('PlatformException');
      throw XWSException(err.code, err.message);
    }
  }

  static Future<dynamic> callAnything(
      String method, Map<String, dynamic> arguments) async {
    try {
      final dynamic result =
      await sharedMethodChannel.invokeMethod(method, arguments);
      return result;
    } on PlatformException {
      print('PlatformException');
    }
    return "";
  }

  static Stream<dynamic> register() {
    return sharedEventChannel.receiveBroadcastStream();
  }
}
