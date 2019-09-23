import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int themeColor = 0xFFC91B3A;
  bool _hasLogin = false;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter App',
        theme: new ThemeData(
          primaryColor: Color(this.themeColor),
          backgroundColor: Color(0xFFEFEFEF),
          accentColor: Color(0xFF888888),
          textTheme: TextTheme(
            //设置Material的默认字体样式
            body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
          ),
          iconTheme: IconThemeData(
            color: Color(this.themeColor),
            size: 35.0,
          ),
        ),
        home: new Scaffold(body: showWelcomePage()),
        debugShowCheckedModeBanner: false);
  }

  showWelcomePage() {
    Future.delayed(Duration(milliseconds: 3000)).then((e) {
      setState(() {
        _isLoading = false;
      });
    });

    if (_isLoading) {
      return Container(
        color: Color(this.themeColor),
        child: Center(
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    } else {
      // 判断是否已经登录
      if (_hasLogin) {
        return Text("123");
      } else {
        return Text("DAFSAF");
      }
    }
  }
}

void main() {
  // 设置全屏
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}
