import 'package:flutter/material.dart';

class IfredomTextField extends StatefulWidget {
  @override
  _IfredomTextFieldState createState() => _IfredomTextFieldState();
}

class _IfredomTextFieldState extends State<IfredomTextField> {
  // 申明焦点
  FocusNode focusNodeUser = new FocusNode();
  FocusNode focusNodePwd = new FocusNode();
  FocusScopeNode focusScopeNode;

  TextEditingController _selectionController = TextEditingController();
  // _selectionController.text="hello world!";
  // _selectionController.selection=TextSelection(
  //     baseOffset: 2,
  //     extentOffset: _selectionController.text.length
  // );

  // initState 只会在初始化时执行一次，所以如果是在初始化之后设置的监听
  // 需要销毁该widget（注释掉）后再重新加载一次
  @override
  void initState() {
    super.initState();

    focusNodeUser.addListener(() {
      print(focusNodeUser.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);

    return Column(children: <Widget>[
      TextField(
        autofocus: true,
        keyboardType: TextInputType.number,
        focusNode: focusNodeUser,
        controller: _selectionController,
        decoration:
            InputDecoration(labelText: "数字用户名输入框", hintText: "用户名placefolder"),
      ),
      TextField(
        focusNode: focusNodePwd,
        decoration: InputDecoration(
          labelText: "本地文字",
          hintText: "本地文字placefolder",
          prefixIcon: Icon(Icons.person),
        ),
      ),
      Builder(builder: (context) {
        return Column(
          children: <Widget>[
            RaisedButton(
              child: Text('移动焦点'),
              onPressed: () {
                // 移动焦点
                // 这是一种写法
                FocusScope.of(context).requestFocus(focusNodePwd);
                // 这是第二种写法
                // if (null == focusScopeNode) {
                //   focusScopeNode = FocusScope.of(context);
                // }
                // focusScopeNode.requestFocus(focusNodePwd);
              },
            ),
            RaisedButton(
              child: Text('隐藏键盘'),
              onPressed: () {
                focusNodeUser.unfocus();
                focusNodePwd.unfocus();
              },
            ),
          ],
        );
      }),
      RaisedButton(
        child: Text('alertDialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('提示！'),
              content: Text('前方高能预警'),
              actions: <Widget>[
                FlatButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    ]);
  }
}

class Point {
  final num x;
  final num y;
  Point(x, y)
      : x = 5,
        y = 6;
}
