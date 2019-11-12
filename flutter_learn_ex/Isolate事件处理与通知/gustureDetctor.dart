import 'package:flutter/material.dart';
import '../动画/img_size.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //定义一个状态，保存当前指针位置
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('raiseButton'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return new FirstPage();
                // return new Text("123");
              },
            ));
          },
        ),
        Builder(
          builder: (context) {
            return GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            );
          },
        )
      ],
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
