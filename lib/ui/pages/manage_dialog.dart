import 'dart:async';

import 'package:first_flutter_app/locator.dart';
import 'package:first_flutter_app/ui/widgets/focus_detector.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final _resumeDetectorKey = UniqueKey();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'FocusDetector Example',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: FocusDetector(
          key: _resumeDetectorKey,
          child: MyHomeDemo(),
          onFocusGained: () {
            print('获取焦点,页面出现  onResume or viewDidAppear');
          },
          onFocusLost: () {
            print('失去焦点,页面隐藏到后台， onPause or viewDidDisappear');
          },
        ),
        // builder: ,
      );
}

// 管理dialog  https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a
class MyHomeDemo extends StatefulWidget {
  @override
  _MyHomeDemoState createState() => _MyHomeDemoState();
}

class _MyHomeDemoState extends State<MyHomeDemo> {
  /// 理解的前提
  Completer _myCompleter = Completer();
  Future startSomething() {
    // show a user dialog or an image picker or kick off a polling function
    return _myCompleter.future;
  }

  void endSomething() {
    _myCompleter.complete();
  }

  _starup() async {
    print('进入启动starup');
    // var myValue = await startSomething();
    print('_myCompleter 只有进入completed 状态后，才会执行打印');
  }

  @override
  void initState() {
    super.initState();
    _starup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FocusDetector Example'),
      ),
      body: Column(
        children: <Widget>[
          Text("123"),
          ElevatedButton(
            child: Text('completed'),
            onPressed: () {
              endSomething();
            },
          )
        ],
      ),
    );
  }
}
