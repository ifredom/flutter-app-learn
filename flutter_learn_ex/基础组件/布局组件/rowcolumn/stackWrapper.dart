import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Text('first row text',style:TextStyle(color: Colors.red)),
            color: Colors.white,
          ),
          Positioned(
            left: 10,
            child: Text('left text'),
          ),
          Positioned(
            top: 20,
            child: Text('top text'),
          )
        ],
      ),
    );
  }
}
