import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  // final String userName;
  final String userName;
  SecondPage({Key key, this.userName}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    print(widget.userName);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print(widget.userName);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("第二个页面的内容标题"),
    );
  }
}
