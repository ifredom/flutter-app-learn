import 'package:flutter/material.dart';

class TargetTestTransition extends StatefulWidget {
  @override
  _TargetTestTransitionState createState() => _TargetTestTransitionState();
}

class _TargetTestTransitionState extends State<TargetTestTransition> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页面'),
      ),
      body: Text("动画测试页面"),
    );
  }
}
