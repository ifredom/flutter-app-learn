import 'package:first_flutter_app/components/route_transition.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/event/myself_event_bus.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 190,
      //  * Flutter提供了一个Form widget，它可以对输入框进行分组，然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。
      child: RaisedButton(
        child: Text('LOGIN PAGE'),
        onPressed: () {
          print("登录");

          // 登录成功后触发登录事件，页面 first_page 中订阅者会被调用
          bus.emit("login", 'ifredom');
          Navigator.of(context).pushNamed('/home');

          // 使用动画效果
          // Navigator.push(context, FadeRoute(builder: (context) {
          //   return HomePage();
          // }));
        },
      ),
    );
  }
}
