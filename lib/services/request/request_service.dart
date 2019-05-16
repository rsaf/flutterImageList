import 'package:xiang_flutter/config/global_config.dart';
import 'dart:convert';
import 'dart:async';
import 'package:xiang_flutter/services/request/request_exception.dart';
import 'package:xiang_flutter/services/api/api.dart';
import 'dart:io';

class RequestService {
  static RequestService shared = RequestService();
  factory RequestService() => SmartRequestService();

  Future<Map> post(String url, Map para) async {
    throw UnimplementedError("saveElement 方法木有实现哦");
  }
}

class SmartRequestService implements RequestService {
  static const String appId = '1255606258';
  static const String region = 'ap-shanghai';
  static const String bucket = 'static';
  static const int onePiece = 2000000;

  Future<Map> post(String url, Map para) async {
    Map headerMap = await _headerInfo(para);
    String httpDomain = await URLWrapper.domainInfo();
    String domain = httpDomain.replaceAll('https://', '');
    HttpClient httpClient = new HttpClient();
    Uri requestUrl = Uri.https(domain, url);

    String payload = json.encode(para);
    HttpClientRequest request = await httpClient.postUrl(requestUrl);
    headerMap.forEach((c, v) => request.headers.add(c, v));
    request.add(utf8.encode(payload));
    HttpClientResponse res = await request.close();

    if (res.statusCode != 200 && res.statusCode != 201) {
      throw XWSException.connectionError;
    }

    String responseBody = await res.transform(utf8.decoder).join();

    Map<String, dynamic> map = json.decode(responseBody);
    httpClient.close();

    return _parse(map);
  }

  Map _parse(Map json) {
    bool success = json['success'] ?? false;
    if (!success) {
      Map error = json["err"];
      if (error == null) {
        throw XWSException.buildDefault();
      } else {
        String msg = error["em"];
        String code = (error["ec"] ?? '').toString();
        throw XWSException(code, msg);
      }
    } else {
      Map data = json["data"];
      if (data == null) throw XWSException.dataEmptyError;

      return data;
    }
  }

  Future<Map> _headerInfo(Map parameter) async {
    Map headerMap =
        await Future.wait([Doraemon.shared.deviceInfo, Doraemon.shared.appInfo])
            .then(_setupDevice);
    headerMap["App-ID"] = Doraemon.wxAppId;
    headerMap["X-Platform"] = GlobalConfig.isAndroid ? "android" : "iOS";
    headerMap["X-Force-Object"] = "0";
    headerMap["Content-Type"] = "application/json; charset=utf-8";
    headerMap["Connection"] = "close";

    Map finalMap = await _setupToken(headerMap, parameter);
    return Map<String, String>.from(finalMap);
  }

  Future<Map> _setupDevice(List<Object> mixed) async {
    Map mapper = {};
    mixed.forEach((obj) async {
      if (obj is AppInfo) {
        mapper["X-Ver"] = '0.16.0';
      }
      mapper["X-Ver"] = '0.16.0';
      if (obj is DeviceInfo) {
        mapper["X-System"] = obj.osSystem;
        mapper["X-Model"] = obj.device;
        mapper["X-Brand"] = obj.brand;
        mapper["X-App-Market"] = obj.brand;
        mapper["xws-distinct-id"] = '123456';
      }
    });

    return mapper;
  }

  Future<Map> _setupToken(Map map, Map parameter) async {
    return map;
  }
}
