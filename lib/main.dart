import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:first_flutter_app/utils/analytics.dart' as Analytics;
import 'package:first_flutter_app/routers/routers.dart';
import 'package:first_flutter_app/routers/application.dart';
import 'package:first_flutter_app/pages/home.dart';

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int themeColor = 0xFFC91B3A;

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
      home: new Scaffold(
        body: new PageHome(),
      ),
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: Application.router.generator,
      navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

void main() {
  runApp(MyApp());
}
