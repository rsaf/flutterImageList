import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xiang_flutter/config/global_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xiang_flutter/bridge.dart';

class ToastService {
  static ToastService shared = ToastService();
  factory ToastService() =>
      GlobalConfig.isSonMode ? SonToastService() : GodToastService();

  Future<void> toast(String msg) async {
    throw UnimplementedError("toast 方法木有实现哦");
  }
}

class GodToastService implements ToastService {
  Future<void> toast(String msg) async {
    Fluttertoast.showToast(msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 2,
      fontSize: 14,
      textColor: Colors.white,
      backgroundColor: Color(0xFF29bf76), );
  }

}

class SonToastService implements ToastService {
  Future<void> toast(String msg) async {
    await BridgeManager.call("toast", {'content' : msg});
  }
}
