import 'package:flutter/material.dart';
import 'package:xiang_flutter/bridge.dart';

class RouterManager {
  static pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      BridgeManager.call("back", {"back": ""});
    }
  }
}
