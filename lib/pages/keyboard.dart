import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 键盘
class DemoKeyboard extends StatelessWidget {
  FocusNode keyboardFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var board;
    if (Platform.isAndroid) {
      board = RawKeyboardListener(
        focusNode: keyboardFocusNode,
        onKey: (keyEvent) {
          // key down
          if (keyEvent.runtimeType.toString() == 'RawKeyDownEvent') {
            RawKeyEventDataAndroid key = keyEvent.data;
            print(key.keyCode);
          } else {
//         key up
          }
        },
        child: Scaffold(
          body: Text("123"),
        ),
      );
    }
    return board;
  }
}
