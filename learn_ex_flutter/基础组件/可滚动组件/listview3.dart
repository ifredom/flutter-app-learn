import 'dart:math';
import 'package:flutter/material.dart';
// 底部导航栏

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        title: Text("商品列表"),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 30, // 无限加载
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'));
          },
        ),
      ),
    ]);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {});
  }
}
