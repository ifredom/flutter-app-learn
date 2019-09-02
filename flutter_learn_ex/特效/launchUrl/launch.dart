import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// 打开一个网页
class IfredomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      onPressed: _launchURL,
      child: Text('Show Flutter homepage'),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
