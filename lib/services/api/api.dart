import 'package:xiang_flutter/services/service_center.dart';
import 'package:xiang_flutter/services/storage/god_storage.dart';
import 'package:xiang_flutter/utils/utils.dart';
import 'dart:async';

abstract class RequestResult {}

class Requesting extends RequestResult {

}

class RequestNone extends RequestResult {

}

class RequestSuccess<T> extends RequestResult {
  T value;
  RequestSuccess(this.value);
}

class RequestFailed extends RequestResult {
  String errCode;
  String errMsg;

  RequestFailed(this.errCode, this.errMsg);
}

// 通用api
abstract class CommonApi {
  // 商品点赞
  static final String toggleLikeTopic = '/aa039/v1/like/topics';

  //关注用户
  static final String toggleFollowUser = '/ba037/follow/dofollow';
}

class URLs {
  static const String stageDomain = 'https://stag-api.xiangwushuo.com';
  static const String releaseDomain = 'https://api.xiangwushuo.com';
  static const String testDomain = 'https://qa-api.xiangwushuo.com';

  // 商品详情
  static const String goodsDetail = '/aa039/v1/topics/detail';
}

// 请用我获取你的完整路径
class URLWrapper {
  static String cachedDomain = '';

  static Future<String> absolutePath(String path) async {
    String domain = await domainInfo();
    return '$domain$path';
  }

  static void resetAll() {
    cachedDomain = '';
  }

  static Future<String> domainInfo() async {
    if (cachedDomain.isNotEmpty) {
      return cachedDomain;
    }

    String domain =
        await GlobalServiceCenter.storage.fetchString('urlDomain') ?? '';
    if (domain.isNotEmpty) {
      cachedDomain = domain;
      return domain;
    } else {
      String newEnv =
          await GlobalServiceCenter.storage.fetchString('envValue') ?? '';
      switch (newEnv) {
        case Util.stageKey:
          return URLs.stageDomain;
          break;
        case Util.testKey:
          return URLs.testDomain;
          break;
        case Util.releaseKey:
          return URLs.releaseDomain;
          break;
        default:
          return URLs.releaseDomain;
          break;
      }
    }
  }
}
