import 'dart:math';

import 'package:english_words/english_words.dart';
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
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        // 如果到了列表末尾
        print(_words[index]);
        if (_words[index] == loadingTag) {
          // 不足100条，则继续获取数据
          print(_words.length);
          if (_words.length - 1 < 20) {
            _retrieveData();
            // 加载时显示loading
            return Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          } else {
            // 已经到了100条数据，不再加载
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text(
                '没有更多了',
                style: TextStyle(color: Colors.lightGreen),
              ),
            );
          }
        }

        // 显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  } 

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
        _words.length - 1,
        generateWordPairs().take(10).map((e) {
          return e.asPascalCase;
        }).toList(),
      );

      setState(() {
        // 重新构建列表
      });
    });
  }
}
