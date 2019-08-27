import 'package:flutter/material.dart';

// Widget管理自己的状态。
// 定义_active：确定盒子的当前颜色的布尔值。
// 定义_handleTap()函数，该函数在点击该盒子时更新_active，并调用setState()更新UI。
// 实现widget的所有交互式行为。
class ManageSelfState extends StatefulWidget {
  ManageSelfState({Key key}) : super(key: key);

  @override
  _ManageSelfStateState createState() => new _ManageSelfStateState();
}

class _ManageSelfStateState extends State<ManageSelfState> {
  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active? Colors.lightGreen[700]:Colors.grey[500]
        ),
        child: Center(
          child: Text('avtive text'),
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
}
