import 'dart:async';

import 'package:first_flutter_app/core/constants/constants.dart';
import 'package:first_flutter_app/ui/pages/error_page.dart';
import 'package:flutter/material.dart';

import 'core/utils/common/logger.dart';
import 'ui/root/room_component.dart';

void main() async {
  // 初始化 访问二进制文件/初始化插件
  WidgetsFlutterBinding.ensureInitialized();

  await runZonedGuarded<Future<void>>(() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return ErrorPage(details);
    };

    // 启动日志
    setupLogger();

    /// 启动GetIt定位服务
    // await setupLocator();

    runApp(RootComponent());
  }, (Object error, StackTrace stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

// Zone中未捕获异常处理回调
// https://github.com/flutter/crashy/blob/master/lib/main.dart
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('异常捕获: $error');
  if (Constants.DEBUG) {
    print('异常处理: 开发模式, 不收集错误，不发送到服务端. $stackTrace');
    return;
  }
  print('发送异常信息到服务器 ...');
}
