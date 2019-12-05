import 'package:flutter/material.dart';

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    // 计算每一个子位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        // 绘制子widger有优化
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

// flow流布局 demo1
class FlexLayoutTestRoutedemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.orange,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.pink,
        ),
      ],
    );
  }
}


// flow流布局 demo1
class FlexLayoutTestRoutedemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: <Widget>[
        new Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('A'),
          ),
          label: new Text('ifredom'),
        ),
        new Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('B'),
          ),
          label: new Text('shoud be'),
        ),
        new Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('C'),
          ),
          label: new Text('good boy'),
        ),
        new Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('C'),
          ),
          label: new Text('i\'m right ok?'),
        ),
      ],
    );
  }
}
