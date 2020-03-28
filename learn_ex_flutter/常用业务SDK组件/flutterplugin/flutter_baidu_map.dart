import 'dart:async';
import 'package:flutter/services.dart';

class FlutterBaiduMap {
  static const MethodChannel _channel =
      const MethodChannel('flutter_baidu_map');

  static Future<bool> init() async {
    return await _channel.invokeMethod('init');
  }
}
