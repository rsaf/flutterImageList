import 'package:flutter_boost/flutter_boost.dart';
import 'package:xiang_flutter/router/route_center.dart';
import 'package:flutter/material.dart';

class FlutterBoostRouteBox implements Router {
  void register(Map<String, RouteBuilder> builders) {
    FlutterBoost.singleton
        .registerPageBuilders(Map<String, PageBuilder>.from(builders));
    FlutterBoost.handleOnStartPage();
  }

  void resolve(String code, Map<dynamic, dynamic> para, BuildContext context) {
    FlutterBoost.singleton
        .openPage('www.xiangwushuo.com?code=${code ?? ""}', {'query': para});
  }

  void pop(Map para, BuildContext context) {
    FlutterBoost.singleton.closePageForContext(context);
  }

  TransitionBuilder homeBuilder() {
    return FlutterBoost.init();
  }

  Widget homePage() {
    return Container();
  }

  void resolvePath(String path, BuildContext context) {
    FlutterBoost.singleton.openPage(path, null);
  }
}
