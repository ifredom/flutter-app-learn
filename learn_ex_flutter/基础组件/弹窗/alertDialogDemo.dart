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
//         child: AlertDialogDemoPage(),
//       ),
//     ),
//   );
/// 方式二。有遮罩，超出弹窗部分隐藏
// Navigator.push(
//   context,
//   new MaterialPageRoute(
//       builder: (_) => AlertDialogDemoPage(), maintainState: true),
// );
class AlertDialogDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // alertDialog要设置狂高，必须要直接包裹SizeBox
    return AlertDialog(
      backgroundColor: Colors.redAccent,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        child: Stack(children: <Widget>[
          RaisedButton(
            child: Text("关闭"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
    );
  }
}
