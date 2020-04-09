import 'package:first_flutter_app/locator.dart';
import 'package:first_flutter_app/ui/pages/provider2_demo.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:first_flutter_app/ui/pages/room_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/managers/core_manager.dart';

void main() async {
  // 初始化 访问二进制文件/初始化插件
  WidgetsFlutterBinding.ensureInitialized();

  // Provider.debugCheckInvalidValueType = null;

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
  @override
  Widget build(BuildContext context) {
    return CoreManager(
      child: MultiProvider(
        providers: [
          // https://stackoverflow.com/questions/59513301/prevent-tried-to-use-provider-with-a-subtype-of-listenable-stream-flutter-erro
          // Provider<ProviderDemoModel>(create: (_) => ProviderDemoModel()),
          ListenableProvider<ProviderDemoModel>(
              create: (_) => ProviderDemoModel()),
          ListenableProvider<Provider2DemoModel>(
              create: (_) => Provider2DemoModel()),
        ],
        child: MaterialApp(
          title: 'Flutter App',
          home: RootComponent(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
