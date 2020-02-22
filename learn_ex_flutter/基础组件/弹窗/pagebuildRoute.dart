import 'package:flutter/material.dart';

///调用方式有2种
/// 方式一。 无遮罩.添加了个动画
//  Navigator.push(
//     context,
//     PageRouteBuilder(
// 点击 dialog 外部是否可消失
//       barrierDismissible: true,
//       opaque: false,
//       pageBuilder: (_, anim1, anim2) => SlideTransition(
//         position: Tween<Offset>(
//                 begin: Offset(0.0, 1.0), end: Offset.zero)
//             .animate(anim1),
//         child: SamplePage(),
//       ),
//     ),
//   );
/// 方式二。有遮罩，超出弹窗部分隐藏
// Navigator.push(
//   context,
//   new MaterialPageRoute(
//       builder: (_) => SamplePage(), maintainState: true),
// );

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        //HERE THE SIZE YOU WANT
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        //your content
        child: Stack(children: <Widget>[
          RaisedButton(
            onPressed: () {
              // Navigator.of(context).pop();
              print("hehe");
            },
            child: Text("Hello world"),
          ),
          Align(
            alignment: Alignment(1.4, -1.4),
            child: GestureDetector(
              child: Text('close'),
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print("object");
              },
            ),
          )
        ]),
      ),
    );
  }
}
