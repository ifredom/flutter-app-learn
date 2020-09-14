import 'package:first_flutter_app/core/constants/app_theme.dart';
import 'package:first_flutter_app/core/managers/core_manager.dart';
import 'package:first_flutter_app/core/managers/restart_manager.dart';
import 'package:first_flutter_app/core/routers/routers.dart';
import 'package:first_flutter_app/ui/root/start_up_view/start_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../provider_setup.dart';

class RootComponent extends StatefulWidget {
  @override
  _RootComponentState createState() => _RootComponentState();
}

class _RootComponentState extends State<RootComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: localizationsDelegates,
      // supportedLocales: supportedLocales,
      // localeResolutionCallback: loadSupportedLocals,
      title: '起点',
      theme: AppTheme.themData,
      navigatorKey: Get.key,
      onGenerateRoute: (settings) => ViewRoutes.generateRoute(context, settings),
      initialRoute: ViewRoutes.startUpView,
    );
  }
}
