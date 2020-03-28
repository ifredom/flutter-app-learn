import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homePage'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("first: $_counter"),
            Text("second Line"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('add'),
        onPressed: _incrementCounter,
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }
}
