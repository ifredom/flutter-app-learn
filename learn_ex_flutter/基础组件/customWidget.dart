import 'package:flutter/material.dart';

// 自定义组件

class IfredomWidget extends StatelessWidget {
  final String label;
  IfredomWidget(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {}, child: new Text(label));
  }
}

// 调用方式 IfredomWidget("Hello");