import 'package:xiang_flutter/bridge.dart';
import 'package:xiang_flutter/services/storage/storage_service.dart';
import 'dart:convert';
import 'dart:async';

class SonStorageService implements StorageService {

  save<T>(String key, T element) async {
    String encodedResult = json.encode(element);
    BridgeManager.call("save", {'key': key, 'value': encodedResult});
  }

  Future<T> fetch<T>(String key) async  {
    String result = await BridgeManager.call("fetch", {'key' : key});
    return json.decode(result);
  }

  Future<String> fetchString(String key) async  {
    String result = await BridgeManager.call("fetchString", {'key' : key});
    return result;
  }
}