import 'package:flutter/material.dart';
import 'pages/row.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IfredomWidget(
      // text: 'hahahhah',
    );
    // return Text("xxx");
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
