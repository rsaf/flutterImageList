
import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:math';
import 'package:crypto/crypto.dart';

class Tools {
  static String toMd5(String str) {
    List<int> content = Utf8Encoder().convert(str);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static int random(int max) {
    return Random().nextInt(max);
  }
}