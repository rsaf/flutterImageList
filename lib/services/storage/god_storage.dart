import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiang_flutter/services/storage/storage_service.dart';
import 'dart:convert';
import 'dart:async';

class GodStorageService implements StorageService {

  save<T>(String key, T element) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String encodedResult = json.encode(element);
    pref.setString(key, encodedResult);
  }

  Future<T> fetch<T>(String key) async  {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String result;
    result = pref.get(key);
    if(result == null) return null;
    return json.decode(result);
  }

  Future<String> fetchString(String key) async  {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String result;
    result = pref.get(key);
    if(result == null) return null;
    return json.decode(result).toString();
  }
}