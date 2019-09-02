import 'package:flutter/material.dart';
import 'pages/row.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldRoute();
    // return Text("xxx");
  }
}
