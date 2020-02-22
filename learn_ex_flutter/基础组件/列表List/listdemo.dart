import 'package:flutter/material.dart';

class LiseDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Text('aaaaaaaaa'),
            // 下边框
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
          );
        });
  }
}
