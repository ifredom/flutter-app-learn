import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Colors.red, Colors.orange[700]]
          // ),
          gradient: RadialGradient(
            //背景径向渐变
            // colors: [Colors.red, Colors.orange],
            center: Alignment.topLeft,
            radius: .98,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(3, 6),
              blurRadius: 4,
            ),
          ]),
      transform: Matrix4.rotationZ(0.4),
      child: Text(
        'card',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
