import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SpinKitFadingCircle(
            color: Colors.orangeAccent,
            size: 50.0,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SpinKitFadingCircle(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              )),
          SpinKitPulse(
            color: Colors.orangeAccent,
            size: 50.0,
          ),
          SpinKitCubeGrid(
            color: Colors.orangeAccent,
            size: 50.0,
          ),
          SpinKitRipple(
            color: Colors.orangeAccent,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
