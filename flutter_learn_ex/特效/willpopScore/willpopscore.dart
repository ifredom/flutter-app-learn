import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _lastPressedAt; // 上次点击时间
  String _tips = "连续点击两次退出APP";

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: (){
        return back();
      },
      child: Container(
        child: Text("2秒内连续点击退出app. $_tips"),
      ),
    );
  }

  Future<bool> back() {

    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      // 两次点击间隔超过2秒
      _lastPressedAt = DateTime.now();
      print("点击了一下");
      setState(() {
        _tips = "第二次";
      });
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}
