import 'package:flutter/material.dart';
import 'dart:math';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {

 Color get randomColor => Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {

    final List<int> pages = List.generate(4, (index) => index);

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Container(
              color: randomColor,
              margin: const EdgeInsets.all(20.0),
            );
          },
        ),
      ),
    );
  }
}
