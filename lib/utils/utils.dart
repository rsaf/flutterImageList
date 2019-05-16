import 'package:flutter/material.dart';
import 'package:xiang_flutter/services/service_center.dart';
import 'package:xiang_flutter/services/api/api.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  static const stageKey = 'Demo';
  static const testKey = 'Test';
  static const releaseKey = 'Release';

  static bool get isDebugMode {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  static void saveEnvironment(String newEnv) {
    GlobalServiceCenter.storage.save('envValue', newEnv);
    URLWrapper.resetAll();
  }

  static Future<String> fetchEnvironment() async {
    String env = await GlobalServiceCenter.storage.fetchString('envValue') ??
        Util.releaseKey;
    return env;
  }

  static void copyToClipboard(final String text) {
    if (text == null) return;
    try {
      Clipboard.setData(new ClipboardData(text: text));
      Fluttertoast.showToast(msg: '复制成功', gravity: ToastGravity.CENTER);
    } catch (err) {
      Fluttertoast.showToast(msg: '复制失败，请重试', gravity: ToastGravity.CENTER);
    }
  }

  static double getDouble(dynamic data) {
    num tempNum = data as num;
    return tempNum.toDouble();
  }

  static int getInt(dynamic data) {
    num tempNum = data as num;
    return tempNum.toInt();
  }

  static Color colorFromHex(String hexColor) {
    if (hexColor == null) return Colors.transparent;
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
