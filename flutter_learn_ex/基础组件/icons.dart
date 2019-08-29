import 'package:flutter/material.dart';
import '../utils/fonts.dart';

class IfredomWidget extends StatelessWidget {
  const IfredomWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconWidget2();
  }
}

// 使用方式一
class IconWidget extends StatelessWidget {
  const IconWidget({Key key});

  @override
  Widget build(BuildContext context) {
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Text(icons,
        style: TextStyle(
            fontFamily: "MaterialIcons",
            fontSize: 40,
            color: Colors.lightBlue));
  }
}

// 使用方式二
class IconWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flex(direction: Axis.horizontal, children: <Widget>[
          Icon(
            Icons.accessible,
            color: Colors.lightGreen,
            size: 80,
          ),
          Icon(
            Icons.error,
            color: Colors.lightBlue,
            size: 80,
          ),
          Icon(
            Icons.fingerprint,
            color: Colors.lightGreenAccent,
            size: 80,
          ),
          Icon(
            MyIcons.wechat,
            color: Colors.lightGreenAccent,
            size: 80,
          ),
        ])
      ],
    );
  }
}
