import 'package:flutter/material.dart';

class PageOtherOne extends StatefulWidget {
  _PageOtherOneState createState() => _PageOtherOneState();
}

class _PageOtherOneState extends State<PageOtherOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("other route page"),
      ),
      body: Center(
        child: Text("This is parent params: "),
      ),
    );
  }
}
