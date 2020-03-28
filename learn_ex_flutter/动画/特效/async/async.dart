import 'package:flutter/material.dart';
class FutureWidget extends StatefulWidget {
  @override
  _FutureWidgetState createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.redAccent,
            onPressed: () async {
              /*
              var number = delayNumber();
              print(number); // print result is: Instance of 'Future<int>'
              */

              // * Add await & async
              var number = await delayNumber();
              print(number); // print result is: 100

            },
            child: Text("Push me"),
          )
        ],
      ),
    );
  }
}

Future<void> asyncMethod() {
  return Future.delayed(
      Duration(seconds: 3), () => print("asyncMethod is called!!!"));
}

// Integer Number
Future<int> delayNumber() {
  return Future.delayed(Duration(seconds: 3), () => 100);
}