import 'package:flutter/material.dart';
import 'frosted_glass_demo.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home:Scaffold(
        body: FrosFromClassDemo(),
      )
    );
  }
}