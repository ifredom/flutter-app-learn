import 'dart:ui';

import 'package:first_flutter_app/ui/pages/page1.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // https://juejin.im/post/6844904176489594893
    final mediaQueryData = MediaQuery.of(context);

    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;

    final dpr = window.devicePixelRatio;

    print("屏幕尺寸 width: $screenWidth height: $screenHeight");
    print("分辨率: $physicalWidth - $physicalHeight");
    print('设备dpr： $dpr');

    // 3.状态栏的高度
    // 有刘海的屏幕:44 没有刘海的屏幕为20
    final statusBarHeight = mediaQueryData.padding.top;
    // 有刘海的屏幕:34 没有刘海的屏幕0
    final bottomHeight = mediaQueryData.padding.bottom;
    print("状态栏height: $statusBarHeight 底部高度:$bottomHeight");

    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            SizedBox(
              width: 100.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(60.0, 100.0), bottomRight: Radius.elliptical(60.0, 100.0))),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "导航栏",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ))
                ],
              ),
            ),
            Column(
              children: <Widget>[
                _buildButton(
                  title: '打开自定义dialog',
                  callback: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        barrierDismissible: true,
                        maintainState: false,
                        barrierColor: Color.fromRGBO(0, 0, 0, 0.6),
                        opaque: false,
                        pageBuilder: (_, anim1, anim2) => SlideTransition(
                          position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(anim1),
                          child: SamplePage(),
                        ),
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: Text("provider测试"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Page1Demo(),
                      ),
                    );
                  },
                ),
                Builder(builder: (context) {
                  return RaisedButton(
                    child: Text("显示SnackBar"),
                    onPressed: () {
                      final scaffold = Scaffold.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('提示信息'),
                          action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                        ),
                      );
                    },
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({String title = '按钮', Function callback}) {
    return RaisedButton(
      child: Text(title),
      onPressed: () {
        callback();
      },
    );
  }

  Widget _buildTestPartOne() {
    print("_build TestPartOne");
    return Consumer(
      builder: (context, ProviderDemoModel snapshot, child) {
        print("_root  partOne 内部");
        return Text(snapshot.price.toString());
      },
    );
  }
}

class BuildTestPartOne extends ViewModelWidget<ProviderDemoModel> {
  BuildTestPartOne({
    Key key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context, model) {
    print("_build 第一部分");
    return Consumer<ProviderDemoModel>(
      builder: (context, snapshot, child) {
        print("_root  partOne 内部");
        return Text(snapshot.price.toString());
      },
    );
  }
}

class BuildTestPartTwo extends ViewModelWidget<ProviderDemoModel> {
  BuildTestPartTwo({
    Key key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context, model) {
    print("_build 第二部分");
    return Text("_buildTestPartTwo: 这里没有刷新");
  }
}

class BuildTestPartThree extends ViewModelWidget<ProviderDemoModel> {
  BuildTestPartThree({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    print("_build 第三部分");
    return Text("BuildTestPartThree: ${model.price}");
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // alertDialog要设置狂高，必须要直接包裹SizeBox
    return AlertDialog(
      // backgroundColor: Colors.redAccent,
      content: SizedBox(
        height: 300,
        width: 500,
        child: Stack(children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: Text("X"),
          ),
          RaisedButton(
            child: Text("关闭"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
      // actions: <Widget>[
      //   FlatButton(
      //     child: Text('close'),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ],
    );
  }
}
