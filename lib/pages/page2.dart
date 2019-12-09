import 'dart:async';
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
  _countdown(_) {
    Timer timer = new Timer(new Duration(seconds: 3), () {
      print("只在倒计时结束时回调");
      _checkInitStateContext();
    });
  }

  _checkInitStateContext() async {
    showDialog(
      context: context,
      builder: (context) {
        return Text('123');
      },
    );
  }

  _diffDate() {
    final birthday = DateTime(2019, 11, 13);
    final date2 = DateTime.now();
    final differenceDay = date2.difference(birthday).inDays;
    final differenceinHours = date2.difference(birthday).inHours;
    print(differenceDay);
    print(differenceinHours);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_countdown);
    _diffDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('page2 build');
    return Scaffold(
      appBar: AppBar(
        title: Text('纯静态，无数据传递'),
        // HitTestBehavior
        // title: Text('${widget.id}'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('下一页'),
          onPressed: () {
            bus.emit("login", "userInfo");
            // Navigator.of(context).pop();

            Navigator.of(context).push(new MaterialPageRoute(
                builder: (_) => new Page3(), maintainState: false));
          },
        ),
      ),
    );
  }
}
