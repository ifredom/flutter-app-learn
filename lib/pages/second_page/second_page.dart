import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:first_flutter_app/event/event_bus.dart';

class SecondPage extends StatefulWidget {
  // final String userName;
  final String userName;
  SecondPage({Key key, this.userName}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    print(widget.userName);

    bus.on("login", (arg) {
      // do something
      print("login message");
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print(widget.userName);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面的内容标题"),
      ),
      body: Center(
        child: Text("This is parent params: ${widget.userName}"),
      ),
    );
  }
}
