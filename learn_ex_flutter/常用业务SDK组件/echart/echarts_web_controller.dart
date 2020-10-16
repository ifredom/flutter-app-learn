import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class EChartsWebController {
  final String htmlLocation;

  EChartsWebController({this.htmlLocation});

  EChartsWebController.init(int id, {this.htmlLocation}) {
    _channel = new MethodChannel('my_echarts_$id');
    _pageFinsihed = EventChannel('my_echarts_stream_pagefinish_$id');
  }

  init(int id) {
    _channel = new MethodChannel('my_echarts_$id');
    _pageFinsihed = EventChannel('my_echarts_stream_pagefinish_$id');
  }

  MethodChannel _channel;
  EventChannel _pageFinsihed;
  EventChannel _pageStarted;

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }

  Future<void> loadData(String html) async {
    assert(html != null);
    return _channel.invokeMethod('loadData', html);
  }

  Future<void> evalJs(String code) async {
    assert(code != null);
    return _channel.invokeMethod('evalJs', code);
  }

  Future<void> initECharts(Map code) async {
    assert(code != null);
    var data = 'init(${json.encode(code).toString()})';
    return evalJs(data);
  }

  Stream<String> get onPageFinished {
    var url = _pageFinsihed.receiveBroadcastStream().map<String>((element) => element);
    return url;
  }

  Stream<String> get onPageStarted {
    var url = _pageStarted.receiveBroadcastStream().map<String>((element) => element);
    return url;
  }
}
