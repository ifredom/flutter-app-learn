import 'dart:async';

import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/peekoutDialog.dart';
import 'package:first_flutter_app/pages/togglevisiable/togglevisiable.dart'
    as prefix0;
import 'package:first_flutter_app/pages/togglevisiable/togglevisiable.dart';
import 'package:flutter/material.dart';
import './flutterplugin/flutter_baidu_map.dart';
import '../tools/myself_event_bus.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  VisibilityState visibilityState = VisibilityState.invisible;
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
            GestureDetector(
              child: Text("进入下一页"),
              onTap: () {
                // HitTestBehavior
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (_) => Page2(), maintainState: false));
              },
            ),
            FloatingActionButton(
              child: Text('测试 Material组件上得MaterialType.transparency属性'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('进入地图'),
              onPressed: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (_) => HomePage(), maintainState: false),
                );
              },
            ),
            RaisedButton(
              child: Text('进入popup'),
              onPressed: () {
                // _askedToLead();

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    barrierDismissible: true,
                    opaque: false,
                    pageBuilder: (_, anim1, anim2) => SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(0.0, 1.0), end: Offset.zero)
                          .animate(anim1),
                      child: SamplePage(),
                    ),
                  ),
                );

                // Navigator.of(context).push(
                //    _DialogRoute<T>(
                //     pageBuilder: pageBuilder,
                //     barrierDismissible: barrierDismissible,
                //     barrierLabel: barrierLabel,
                //     barrierColor: barrierColor,
                //     transitionDuration: transitionDuration,
                //     transitionBuilder: transitionBuilder,
                //   )
                // );

                // fullscreenDialog
              },
            ),
            RaisedButton(
              child: Text('测试隐藏功能,点击'),
              onPressed: () {
                setState(() {
                  if (visibilityState == prefix0.VisibilityState.visible) {
                    visibilityState = prefix0.VisibilityState.invisible;
                  } else {
                    visibilityState = prefix0.VisibilityState.visible;
                  }
                });
              },
            ),
            Visibiliable(
              child: RaisedButton(
                child: Text('测试隐藏功能,隐藏消失'),
                onPressed: () {},
              ),
              visibility: visibilityState,
            )
          ],
        ),
      ),
    );
  }
}

/// 通过学习使用Popup深入学习如何使用api document。未完
class MePopUpRoute extends PopupRoute {
  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.green;

  @override
  String get barrierLabel => "modalBarrierDismissLabel";
  // String get barrierLabel => MaterialLocalizations.of(context).modalBarrierDismissLabel;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Container();
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        //HERE THE SIZE YOU WANT
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        //your content
        child: Stack(children: <Widget>[
          RaisedButton(
            onPressed: () {
              // Navigator.of(context).pop();
              print("hehe");
            },
            child: Text("Hello world"),
          ),
          Align(
            alignment: Alignment(1.4, -1.4),
            child: GestureDetector(
              child: Text('close'),
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print("object");
              },
            ),
          )
        ]),
      ),
    );
  }
}
