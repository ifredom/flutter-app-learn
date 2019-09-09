import 'package:flutter/material.dart';

class PageOtherOne extends StatefulWidget {
  // final String userName;
  final String userName;
  PageOtherOne({Key key, @required this.userName}) : super(key: key);

  _PageOtherOneState createState() => _PageOtherOneState();
}

class _PageOtherOneState extends State<PageOtherOne> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("other route page"),
      ),
      body: Center(
        child: Text("This is parent params: ${widget.userName}"),
      ),
    );
  }
}
