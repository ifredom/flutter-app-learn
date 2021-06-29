import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlayMusic extends StatefulWidget {
  @override
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> with WidgetsBindingObserver {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  /// 使用inappwebview
  AppLifecycleState appLifecycleState;
  InAppLocalhostServer localhostServer = new InAppLocalhostServer(port: 8081);
  InAppWebViewController webViewController;

  Future _initLocalServe() async {
    print("开启服务");
    await localhostServer.start();
  }

  Future _initLocalClose() async {
    await localhostServer.close();
    print("关闭服务");
  }

  @override
  void initState() {
    super.initState();
    _initLocalServe();
  }

  @override
  void dispose() {
    _initLocalClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 629,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    "assets/images/bg/home.png",
                  ),
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Positioned(
                    top: 39,
                    left: 31,
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/images/actives/play_back.png",
                        width: 50,
                        height: 50,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Positioned(
                    top: 18,
                    child: Container(
                      padding: EdgeInsets.only(left: 40),
                      width: 182,
                      height: 37,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                            "assets/images/actives/music_title.png",
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "跳舞的音乐",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 39,
                    right: 31,
                    child: Container(
                      padding: EdgeInsets.only(left: 80),
                      width: 298,
                      height: 74,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                            "assets/images/actives/device_sucess.png",
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "设备已连接",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 486,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  // color: Colors.transparent,
                  border: Border.all(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  )),
              child: _buildMusicScoreWebView(),
            ),
          ),
        ],
      ),
    );
  }

  /// 使用webview_plugin插件
  Widget _buildMusicScoreWebView() {
    return _buildWebview();
  }

  // ignore: unused_element
  Widget _buildWebviewScaffold() {
    return WebviewScaffold(
      url: "http://localhost:8081/assets/webview/dist/index.html",
      // url: url,
      withLocalUrl: true, // 是否允许加载本地文件
      withZoom: true, //是否可以缩放
      withLocalStorage: true, //是否启用缓存
      hidden: false, //默认状态下是否隐藏
      initialChild: Container(
        color: Colors.white,
        child: Center(child: Text('loading...')),
      ),
      // appBar: new AppBar(title: Text("webview")),
      key: _scaffoldKey,
    ); //等待加载过程的界面
  }

  /// 使用 webview_flutter 插件
  Widget _buildWebview() {
    String url = "http://localhost:8081/assets/webview/dist/index.html"; // "https://www.baidu.com"

    /// 使用SizeBox包裹, 可以在页面中部分显示
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: WebView(
        /// 加载本地文件使用 file://开头，例如: file://xxxx/xxx/xxx/html
        initialUrl: url,
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([]),
        onWebViewCreated: (WebViewController controller) {
          controller.loadUrl(url);
          controller.canGoBack().then((res) {
            // 返回上一期
          });
          controller.currentUrl().then((url) {
            // url 当前地址
          });
          controller.canGoForward().then((res) {});
        },
        onPageFinished: (url) {},
      ),
    );
  }

  // ignore: unused_element
  Widget _buildInappWebview() {
    return InAppWebView(
      initialUrl: "http://localhost:8081/assets/webview/dist/index.html",
      initialHeaders: {},
      initialOptions: InAppWebViewWidgetOptions(
        inAppWebViewOptions: InAppWebViewOptions(
          debuggingEnabled: true,
          // useShouldOverrideUrlLoading: true,
          // useOnLoadResource: true,
        ),
      ),
      shouldOverrideUrlLoading: (InAppWebViewController controller, String url) {},
      onWebViewCreated: (InAppWebViewController controller) {
        print("onWebViewCreated");
        webViewController = controller;
      },
      onLoadStart: (InAppWebViewController controller, String url) {
        print("onLoadStart: $url");
      },
      onLoadStop: (InAppWebViewController controller, String url) {
        print("onLoadStop: $url");
      },
      onProgressChanged: (InAppWebViewController controller, int progress) {
        print(progress / 100);
      },
    );
  }
}
