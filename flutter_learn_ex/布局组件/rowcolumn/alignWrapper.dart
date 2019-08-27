import 'package:flutter/material.dart';

// align布局  相对定位



class AlignLayoutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionalWidget();
  }
}

// FractionalOffset Widget
// FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！
// 实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
class FractionalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      color: Colors.blue[50],
      child: Align(
        alignment: FractionalOffset(0,0.6),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

// Align Widget
// Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0)
// Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标
// (Alignment.x*childWidth/2+childWidth/2, Alignment.x*childHeight+childHeight/2)
// 2个水平（或垂直）单位则等于矩形的宽(或高)
class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        //  重点
        alignment: Alignment(2,0),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}
