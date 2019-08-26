import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('你好大宝贝儿'), Text('我是水我在哪我在做什么')],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('你好大宝贝儿你好大宝贝儿你好大宝贝儿你好大宝贝儿你好大宝贝儿你好大宝贝儿'), Text('我是水我在哪我在做什么')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.ltr,
          children: <Widget>[Text('你好大宝贝儿'), Text('我是水我在哪我在做什么')],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[Text('你好大宝贝儿'), Text('我是水我在哪我在做什么')],
        )
      ],
    );
  }
}
