import 'package:flutter/material.dart';
import 'dart:io' show Platform;

enum XWSStyle {
  light,
  dark,
  clear
}

class XWSColor {
  static const Color xwsGreen = Color(0xFF2bbe76);
  static const Color xwsWhite = Colors.white;
  static const Color xwsCharcoal = Color(0xFF303231);
  static const Color xwsGray= Color(0xFFf6f6f6);
  static const Color xwsYellow= Color(0xFFffe9ab);

  //...这里定义你的颜色

  static Color themeColor(XWSStyle style) {
    switch(style) {
      case XWSStyle.light:
        return XWSColor.xwsWhite;
      case XWSStyle.dark:
        return XWSColor.xwsGreen;
      case XWSStyle.clear:
        return Colors.transparent;
    }
    return Colors.black;
  }

  // 需要通过style判断就这样写

  static Color themeTitleColor(XWSStyle style) {
    switch(style) {
      case XWSStyle.light:
        return XWSColor.xwsCharcoal;
      case XWSStyle.dark:
        return XWSColor.xwsWhite;
      case XWSStyle.clear:
        return XWSColor.xwsWhite;
    }

    return Colors.black;
  }
}

class XWSIcon {

  // 请在这里添加你的icon
  static Icon back(XWSStyle style) {
    return new Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: XWSColor.themeTitleColor(style));
  }
}