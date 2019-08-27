import 'package:flutter/material.dart';

// 父Widget管理子Widget的状态。
// ParentWidgetState 类:
// 为TapboxB 管理_active状态。
// 实现_handleTapboxChanged()，当盒子被点击时调用的方法。
// 当状态改变时，调用setState()更新UI。

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChildWidget(
        active: this._active,
        onParentChange: _handleTapboxChanged,
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  ChildWidget({Key key, this.active: false, @required this.onParentChange})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onParentChange;

  void _handleTap() {
    onParentChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[500]),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
