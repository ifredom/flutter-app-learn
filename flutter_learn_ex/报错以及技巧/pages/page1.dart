import 'package:flutter/material.dart';

import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print('page1 build');
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: RaisedButton(
        child: Text('下一页'),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (_) => Page2(id: 2), maintainState: true));
        },
      ),
    );
  }
}
