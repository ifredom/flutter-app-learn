import 'package:flutter/material.dart';

// 测试数据在多级 父子组件中传递
class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
//设定Widget的偏移量
  Offset offset = Offset(20, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        alignment: Alignment.topLeft,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: _dragTargetWidget(),
          ),
          _dragbleBoxWidget(),
        ],
      ),
    );
  }

  Widget _dragTargetWidget() {
    return Draggable(
      // 定义拖动传输的数据
      data: 4,
      // 控制widget在拖动时，只能横向
      // axis: Axis.horizontal,
      //创建可以被拖动的Widget
      child: Container(
        width: 50,
        height: 50,
        color: Colors.green,
        child: Center(
          child: Text(
            "4",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      //拖动过程中的Widget
      feedback: Material(child: Text('dragging')),
      // 拖动过程中，原位置显示的widget，如果不需要可以直接设置为Container()
      childWhenDragging: Text('trace'),
      //拖动结束后的Widget
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        // 更新位置信息
        print("----onDraggableCanceled,拖拽取消");
      },
      //开始拖拽
      onDragStarted: () {
        print("----onDragStarted,开始拖拽");
      },
      // 拖拽到DragTarget且接受的时候回调
      onDragCompleted: () {
        print("----onDragCompleted,拖拽完成");
      },
    );
  }

  Widget _dragbleBoxWidget() {
    return Container(
      // width: 100,
      // height: 100,
      color: Colors.orange,
      child: DragTarget(
        builder:
            (context, List<int> candidateData, List<dynamic> rejectedData) {
          ///candidateData，当Draggable被拖到DragTarget上的时候的data，已经准备好接受
          print("----candidateData" + candidateData.toString());

          ///rejectData，当Draggable被拖到DragTarget上的时候，不被接受
          print("----rejectedData" + rejectedData.toString());

          ///这两个数据都是正拖到上面的时候，还没放到上面，还没松手
          return Center(
            child: Text(
                candidateData.toString() + "----" + rejectedData.toString()),
          );
        },
        //接收Draggable的data数据，判断是否接收
        onWillAccept: (data) {
          print("----onWillAccept,拖拽" + data.toString() + "到target");
          if (data == 4) {
            return true;
          } else {
            return false;
          }
        },
        //当拖到DragTarget的时候，松手后
        onAccept: (data) {
          print("----onAccept,接收" + data.toString());
          scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text(data.toString())));
        },

        ///拖到上面，没有松手，又离开
        onLeave: (data) {
          print("----onLeave,离开" + data.toString());
        },
      ),
    );
  }
}
