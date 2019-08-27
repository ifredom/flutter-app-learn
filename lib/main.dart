import 'package:flutter/material.dart';
import 'row.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('抽屉')),
        body: new Center(
          //中央内容部分body
          child: AlignLayoutTest(),
        )
      );
  }
}

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: new HomePage(),
        ));
  }
}
