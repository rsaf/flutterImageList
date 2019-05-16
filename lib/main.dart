import 'dart:ui';
import 'dart:io';

import 'package:flutter/painting.dart' show PaintingBinding;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/rendering.dart';

import 'package:xiang_flutter/router/route_center.dart';

void main() => {
      debugPaintSizeEnabled = false,
      RouteCenter.register(),
      runApp(MyApp()),
    };

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //get cache instance
  ImageCache get imageCache => PaintingBinding.instance.imageCache;

  @override
  Widget build(BuildContext context) {
// image cache amount（default = 1000）
    imageCache.maximumSize = 10;
// cache size（default = 50M）
    imageCache.maximumSizeBytes = 50 << 5;

    return MaterialApp(
      title: 'Image list',
      builder: RouteCenter.homeBuilder(),
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
          primaryColor: Color(0XFF29BF76),
          primaryColorDark: Color(0XFF29BF76),
          brightness: Brightness.light,
          primaryColorBrightness: Brightness.dark,
          accentColorBrightness: Brightness.dark,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          canvasColor: Colors.white,
          fontFamily: Platform.isIOS ? 'PingFang SC' : null,
          buttonTheme: ButtonThemeData(minWidth: 40.0, height: 26.0),
          textTheme: TextTheme(
            body1: Platform.isIOS
                ? TextStyle(color: Color(0xFF303231), fontFamily: 'PingFang SC')
                : TextStyle(color: Color(0xFF303231)),
            // body2: TextStyle(color: Color(0xFF303231))
          )),
      home: RouteCenter.homePage(),
    );
  }
}
