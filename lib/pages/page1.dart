import 'dart:async';

import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/peekoutDialog.dart';
import 'package:flutter/material.dart';
import './flutter_baidu_map.dart';
import '../tools/myself_event_bus.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    initBaidu();

    bus.on("login", (arg) {
      print('监听到事件');
    });

    super.initState();
  }

  void initBaidu() async {
    bool result = await FlutterBaiduMap.init();
    if (result) {
      print("百度地图加载成功...");
    } else {
      print("百度地图加载失败...");
    }
  }

  @override
  Widget build(BuildContext context) {
    print('page1 build');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(150.0, 50.0),
                              bottomRight: Radius.elliptical(150.0, 50.0))),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "My app title!",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ))
                ],
              ),
            ),
            RaisedButton(
              child: Text('点击进入下一页'),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (_) => Page2(), maintainState: true));
              },
            ),
            FloatingActionButton(
              child: Text('测试 Material组件上得MaterialType.transparency属性'),
              onPressed: () {},
            ),
            FloatingActionButton(
              child: Text('进入地图'),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (_) => HomePage(), maintainState: true));
              },
            )
          ],
        ),
      ),
    );
  }
}
