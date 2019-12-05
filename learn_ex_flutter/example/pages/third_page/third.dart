import 'package:first_flutter_app/pages/transition_page/transtion_route.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  Widget build(BuildContext context) {
    return new Center(
      child: RaisedButton(
        child: Text("前往动画页"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return TranstionRoutePage();
            }),
          );
        },
      ),
    );
  }
}
