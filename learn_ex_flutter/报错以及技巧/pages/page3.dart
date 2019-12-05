import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  final num id;
  Page3({Key key, this.id}) : super(key: key);
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    print('page3 build');
    return Scaffold(body: Text('${widget.id}'));
  }
}
