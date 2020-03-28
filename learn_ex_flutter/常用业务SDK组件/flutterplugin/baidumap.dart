import 'package:flutter/material.dart';

class BaiduMapTestPage extends StatefulWidget {
  @override
  _BaiduMapTestPageState createState() => _BaiduMapTestPageState();
}

class _BaiduMapTestPageState extends State<BaiduMapTestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: AndroidView(viewType: "MapView"))
        ],
      ),
    );
  }
}
