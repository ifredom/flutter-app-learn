import 'dart:async';

import 'package:flutter/services.dart';

import 'baiduLocation.dart';

class QwkBaidumap {
  static const MethodChannel _channel = const MethodChannel('baidumap');

  static Future<BaiduLocation> get local async {
    final BaiduLocation version =
        BaiduLocation.fromMap(await _channel.invokeMethod('getLocal'));

//    return "X:${version.latitude.toString()} , Y:${version.longitude.toString()}";
    return version;
  }
}
