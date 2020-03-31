import 'package:first_flutter_app/widgets/focus_detector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final _resumeDetectorKey = UniqueKey();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'FocusDetector Example',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: FocusDetector(
          key: _resumeDetectorKey,
          child: Scaffold(
            appBar: AppBar(
              title: Text('FocusDetector Example'),
            ),
          ),
          onFocusGained: () {
            print('Focus gained, equivalent to onResume or viewDidAppear');
          },
          onFocusLost: () {
            print('Focus lost, equivalent to onPause or viewDidDisappear');
          },
        ),
      );
}
