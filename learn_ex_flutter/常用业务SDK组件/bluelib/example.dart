import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../bluelib/device_repository.dart';
import 'blue_utils.dart';

class PlayMusic extends StatefulWidget {
  PlayMusic({Key key});

  @override
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> with WidgetsBindingObserver {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  bool _shouldRunOnResume = true;
  StreamSubscription _appStateSubscription;
  BlueUtils _blueUtils = BlueUtils(DeviceRepository(), BleManager());

  void _onResume() {
    print("onResume init");
    _blueUtils.init();
    _appStateSubscription = _blueUtils.pickedDevice.listen((bleDevice) async {
      print("选取设备");
      _onPause();
      _shouldRunOnResume = true;
    });
  }

  void _onPause() {
    print("onPause");
    _appStateSubscription.cancel();
    _blueUtils.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("play_music 生命周期 didChangeDependencies");
    if (_blueUtils == null) {
      if (_shouldRunOnResume) {
        _shouldRunOnResume = false;
        _onResume();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // _blueUtils.init();
  }

  @override
  void dispose() {
    print("dispose生命周期");
    // _blueUtils.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 486,
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.transparent,
                border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.7), width: 5),
              ),
              child: MusicScoreWebView(flutterWebViewPlugin),
            ),
          ),
        ],
      ),
    );
  }
}

class MusicScoreWebView extends StatefulWidget {
  final flutterWebViewPlugin;
  final bool show;
  MusicScoreWebView(this.flutterWebViewPlugin, {Key key, this.show = false});

  @override
  _MusicScoreWebViewState createState() => _MusicScoreWebViewState();
}

class _MusicScoreWebViewState extends State<MusicScoreWebView> {
  @override
  Widget build(BuildContext context) {
    // String url = "http://localhost:8085/assets/webview/index_test.html";
    String url = "http://localhost:8085/assets/webview/dist/index.html";

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: 500, // 去掉高度尝试
      child: WebviewScaffold(
        key: Key("webview"),
        // url: "http://file.youxspace.com",
        url: url,
        mediaPlaybackRequiresUserGesture: false,
        withZoom: false,
        withLocalStorage: true,
        appCacheEnabled: true,
        allowFileURLs: true,
        hidden: true,
        debuggingEnabled: false,
        initialChild: Container(
          child: const Center(child: Text('正在加载中.....')),
        ),
        // appBar: AppBar(
        //   title: const Text('Widget WebView'),
        // ),
      ),
    );
  }
}
