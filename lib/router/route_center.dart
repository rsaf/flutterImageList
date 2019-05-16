import 'package:xiang_flutter/pages/dev_main/dev_main.dart';
import 'package:flutter/material.dart';
import 'package:xiang_flutter/router/god_router.dart';

import 'package:xiang_flutter/pages/test_pages/image_list_performance.dart';

const videoUrl =
    'https://hotvideo-1255606258.cos.ap-shanghai.myqcloud.com/video/201810/01dEhgkn2W.mp4';

typedef Widget RouteBuilder(
    String code, Map<dynamic, dynamic> para, String path);

class Routes {
  static const String socialGardenFollowList = '2009';
}

class Router {
  void register(Map<String, RouteBuilder> builders) {
    throw UnimplementedError("register 方法木有实现哦");
  }

  void resolve(String code, Map<dynamic, dynamic> para, BuildContext context) {
    throw UnimplementedError("resolve 方法木有实现哦");
  }

  void resolvePath(String path, BuildContext context) {
    throw UnimplementedError("resolvePath 方法木有实现哦");
  }

  TransitionBuilder homeBuilder() {
    throw UnimplementedError("homeBuilder 方法木有实现哦");
  }

  Widget homePage() {
    throw UnimplementedError("homeBuilder 方法木有实现哦");
  }

  void pop(Map para, BuildContext context) {
    throw UnimplementedError("pop 方法木有实现哦");
  }
}

class RouteCenter {
  static Router _route = GodRouteBox();

  static void register() {
    _route.register({
      //  ==== 路由注册开始 ====
      //
      // ~##DevMainPage##~
      '998': (pageName, params, _) => DevMainPage(),
      //
      //
      // *********
      // *********
      // 测试专用路由
      // ~##ImageListPerformanceTest##~ 这是我的参数~@@topicId@@~
      // *********
      // *********
      //
      'ImageListPerformanceTest': (pageName, params, _) =>
          ImageListPerformanceTest(
            params != null ? params['topicId'] : null,
          ),

      //
      // ==== 路由注册结束 ====
    });
  }

  static void resolve(
      String code, Map<dynamic, dynamic> para, BuildContext context) {
    _route.resolve(code, para, context);
  }

  static void resolvePath(String path, BuildContext context) {
    _route.resolvePath(path, context);
  }

  static TransitionBuilder homeBuilder() {
    return _route.homeBuilder();
  }

  static Widget homePage() {
    return _route.homePage();
  }

  static void pop(BuildContext context, {Map para}) {
    _route.pop(para, context);
  }
}
