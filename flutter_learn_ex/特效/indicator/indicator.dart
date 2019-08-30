import 'package:flutter/material.dart';

class IfredomTextField extends StatefulWidget {
  @override
  _IfredomTextFieldState createState() => _IfredomTextFieldState();
}

class _IfredomTextFieldState extends State<IfredomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 模糊进度条(会执行一个旋转动画)
      CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
      // 进度条显示50%，会显示一个半圆
      CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: .5,
      ),
      // 模糊进度条(会执行一个动画)
      LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
      // 进度条显示50%
      LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: .5,
      ),
      SizedBox(
        height: 100,
        width: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.green),
          value: .7,
        ),
      ),
      SizedBox(
        height: 3,
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
        ),
      ),
    ]);
  }
}

class Point {
  final num x;
  final num y;
  Point(x, y)
      : x = 5,
        y = 6;
}
