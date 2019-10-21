import 'package:flutter/material.dart';
import 'dart:math';

// 自绘棋盘
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    // 网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black54
      ..strokeWidth = 1.0;

    for (var i = 0; i < 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (var i = 0; i < 15; ++i) {
      double dx = eHeight * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(
        size.width / 2 - eWidth / 2,
        size.height / 2 - eHeight / 2,
      ),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(
        size.width / 2 + eWidth / 2,
        size.height / 2 - eHeight / 2,
      ),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


///自定义一个圆形进度
// final Widget pageChild = Builder(builder: (builder) {
//   return SpinKitRotatingCircle(
//     color: Colors.white,
//     size: 50.0,
//   );
// });