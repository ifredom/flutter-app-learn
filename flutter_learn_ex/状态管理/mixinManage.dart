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
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

// 子组件

class ChildWidget extends StatefulWidget {
  ChildWidget({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _ChildWidgetState createState() => new _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            widget.active?'Actived':'Inactive',
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[500],
          border: _highlight? new Border.all(color: Colors.teal[700],width: 10,): null,
        )
      )
    );
  }
}
