import 'package:flutter/material.dart';

class OpacityDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        opacity: 0.5,
        child: Text("透明"),
      ),
    );
  }
}
