import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaiduMapTestPage extends StatefulWidget {
  @override
  _BaiduMapTestPageState createState() => _BaiduMapTestPageState();
}

class _BaiduMapTestPageState extends State<BaiduMapTestPage> {
  @override
  Widget build(BuildContext context) {
    var nativeView = AndroidView(viewType: "MapView");
    if (defaultTargetPlatform == TargetPlatform.android) {
      nativeView = AndroidView(viewType: "MapView");
    } else {
      // nativeView = UiKitView(viewType: "MapView");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: nativeView,
          )
        ],
      ),
    );
  }
}
