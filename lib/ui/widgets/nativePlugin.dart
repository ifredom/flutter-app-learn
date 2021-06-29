import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 调用方式：首先在mainActivity.java写好原生代码，然后push当当前widget即可

class NativePluginDemo extends StatefulWidget {
  @override
  _NativePluginDemoState createState() => _NativePluginDemoState();
}

class _NativePluginDemoState extends State<NativePluginDemo> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new ElevatedButton(
                child: new Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              new Text(
                _batteryLevel,
                style: TextStyle(color: Colors.black38),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
