import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        /// 可使用值 Alignment.center 或者 AlignmentDirectional(0, 0)
        alignment: AlignmentDirectional(0, 0),

        /// 超出区域是否可见
        // overflow: Overflow.visible,

        /// StackFit.loose：子组件宽松取值，可以从 min 到 max。
        /// StackFit.expand：子组件取最大值。
        /// StackFit.passthrough：不改变子组件约束条件。
        // fit: tackFit.loose,

        children: <Widget>[
          Container(
            child: Text('first row text', style: TextStyle(color: Colors.red)),
            color: Colors.white,
          ),
          Positioned(
            left: 10,
            child: Text('left text'),
          ),
          Positioned(
            top: 20,
            child: Text('top text'),
          )
        ],
      ),
    );
  }
}
