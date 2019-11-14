import 'package:first_flutter_app/tools/myself_event_bus.dart';
import 'package:flutter/material.dart';

import 'page3.dart';

class Page2 extends StatefulWidget {
  // final num id;
  // Page2({Key key, this.id}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  _checkInitStateContext(_) async {
    showDialog(
      context: context,
      builder: (context) {
        return Text('123');
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_checkInitStateContext);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('page2 build');
    return Scaffold(
      appBar: AppBar(
        title: Text('纯静态，无数据传递'),
        // title: Text('${widget.id}'),
      ),
      body: RaisedButton(
        child: Text('下一页'),
        onPressed: () {
          bus.emit("login", "userInfo");
          // Navigator.of(context).pop();
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (_) => new Page3(), maintainState: true));
        },
      ),
    );
  }
}
