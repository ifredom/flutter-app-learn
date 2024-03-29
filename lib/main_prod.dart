import 'dart:async';
import 'package:first_flutter_app/ui/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/root/room_component.dart';

void main() {
  // 参考 https://github.com/xinsui01/github-app-flutter
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return ErrorPage(details);
    };
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
        .then((_) {
      runApp(RootComponent());
    });
  }, (Object obj, StackTrace stack) async {
    // Zone中未捕获异常处理回调
    // print(obj);
    // print(stack);
  });
}
