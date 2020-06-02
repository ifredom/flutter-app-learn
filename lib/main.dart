import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import './locator.dart';

import 'core/constants/app_theme.dart';
import 'core/managers/core_manager.dart';
import 'core/managers/restart_manager.dart';
import 'core/routers/routers.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/store/provider_setup.dart';
import 'core/utils/common/logger.dart';
import 'ui/root/room_component.dart';

void main() async {
  // 初始化 访问二进制文件/初始化插件
  WidgetsFlutterBinding.ensureInitialized();

  /// 启动日志
  setupLogger();

  /// 启动GetIt定位服务
  await setupLocator();

  // 设置全屏
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return RestartManager(
      child: MultiProvider(
        providers: providers,
        child: CoreManager(
          child: OKToast(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // localizationsDelegates: localizationsDelegates,
              // supportedLocales: supportedLocales,
              // localeResolutionCallback: loadSupportedLocals,
              title: '享弹',
              theme: AppTheme.themData,
              navigatorKey: navigationService.navigatorKey,
              onGenerateRoute: (settings) =>
                  RoutesUtils.generateRoute(context, settings),
              home: RootComponent(),
            ),
          ),
        ),
      ),
    );
  }
}
