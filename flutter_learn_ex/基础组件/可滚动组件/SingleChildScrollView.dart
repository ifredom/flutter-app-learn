import 'package:flutter/material.dart';

class IfredomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: str.split("").map((item) {
              return Text(
                item,
                textScaleFactor: 2.0,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
