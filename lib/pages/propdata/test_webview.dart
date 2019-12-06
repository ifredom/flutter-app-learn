import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return Text('123');
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('flutter'),
    //   ),
    //   body: WebviewScaffold(
    //     url: 'https://www.iqiyi.com/',
    //     withZoom: true,
    //     withLocalStorage: true,
    //     withJavascript: true,
    //     scrollBar: false,
    //   ),
    // );
  }
}
