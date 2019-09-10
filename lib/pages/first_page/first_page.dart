import 'package:flutter/material.dart';
import 'package:first_flutter_app/event/myself_event_bus.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // 测试事件总线
    bus.on("login", (arg) {
      print('监听到登录事件');
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Text('first page'),
    );
  }
}
