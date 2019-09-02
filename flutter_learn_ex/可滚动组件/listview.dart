import 'package:flutter/material.dart';
// 底部导航栏

class IfredomRoute extends StatefulWidget {
  @override
  _IfredomRouteState createState() => _IfredomRouteState();
}

class _IfredomRouteState extends State<IfredomRoute> {
  @override
  Widget build(BuildContext context) {
    return myListBuider();
  }

  Widget myListBuider() {
    return ListView.builder(
      // itemCount: 100,
      itemExtent: 50,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("$index"),
        );
      },
    );
  }

  Widget myListSeparated() {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.red);
    return ListView.separated(
      itemCount: 30,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          title: Text('\$$index'),
        );
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}
