import 'package:first_flutter_app/locator.dart';
import 'package:first_flutter_app/managers/core_manager.dart';
import 'package:first_flutter_app/pages/provider_demo.dart';
import 'package:first_flutter_app/pages/provider2_demo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/pages/room_component.dart';

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
          theme: new ThemeData(
            primaryColor: Color(0xFFC91B3A),
            backgroundColor: Color(0xFFEFEFEF),
            accentColor: Color(0xFF888888),
            textTheme: TextTheme(
              //设置Material的默认字体样式
              body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
            ),
            iconTheme: IconThemeData(
              color: Color(0xFFC91B3A),
              size: 35.0,
            ),
          ),
          home: RootComponent(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
