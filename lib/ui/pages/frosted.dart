// https://medium.com/saugo360/https-medium-com-saugo360-flutter-using-overlay-to-display-floating-widgets-2e6d0e8decb9

import 'dart:ui';

import 'package:flutter/material.dart';

// 模糊玻璃效果，想尝试弹窗
class FrostedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new FlutterLogo()),
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: new Center(
                    child: new Text('Frosted',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
