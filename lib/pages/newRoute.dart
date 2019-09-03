import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    this.text = "default value", // 接收一个text参数,可以被覆盖
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is parent params: $text"),
      ),
    );
  }
}
