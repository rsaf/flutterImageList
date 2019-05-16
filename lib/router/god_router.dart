import 'route_center.dart';
import 'package:flutter/material.dart';
import 'package:xiang_flutter/pages/dev_main/dev_main.dart';

class GodRouteBox implements Router {
  Map<String, RouteBuilder> routeMapping = {};

  void register(Map<String, RouteBuilder> builders) {
    routeMapping = builders;
  }

  void resolve(String code, Map<dynamic, dynamic> para, BuildContext context) {
    RouteBuilder builder = routeMapping[code];
    if(builder != null) {
      Widget builtPage = builder(code, para, '');
      MaterialPageRoute route = MaterialPageRoute(builder: (c) => builtPage);
      Navigator.push(context, route);
    } else {
      print('$code 木有注册过吧');
    }
  }

  TransitionBuilder homeBuilder() {
    return null;
  }


  Widget homePage() {
//    throw DevMainPage();
    return DevMainPage();
  }

  void resolvePath(String path,  BuildContext context) {
    throw UnimplementedError("resolvePath 方法木有实现哦");
  }

  void pop(Map para, BuildContext context) {
    Navigator.of(context).pop();
  }
}