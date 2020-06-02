import 'package:first_flutter_app/ui/pages/404.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutesUtils {
  static const String homePage = 'app://';
  static const String webViewPage = "app://webview";
  static const String playViewPage = "app://playview";
  static const String audioPlayDemoPage = "app://audioPlayDemo";

  static Route<dynamic> generateRoute(
      BuildContext context, RouteSettings settings) {
    return GetRouteBase(
      settings: RouteSettings(name: settings.name),
      page: _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      
      default:
        return WidgetNotFound();
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}

/// 使用方式
// locator<NavigationService>().push(FreemodeRouter.freemodeBooklistPage);
