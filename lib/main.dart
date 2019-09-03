import 'package:flutter/material.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/newRoute.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: Scaffold(
      //   body: new HomePage(),
      // ),
      routes: {
        "/":(context)=> MyHomePage(), //注册首页路由
        "new_page":(context)=> NewRoute(text:'传参'),
      },
    );
  }
}
