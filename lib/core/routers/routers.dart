import 'package:first_flutter_app/ui/pages/404.dart';
import 'package:first_flutter_app/ui/pages/page1.dart';
import 'package:first_flutter_app/ui/root/start_up_view/start_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewRoutes {
  static const String homePage = '/';
  static const String startUpView = "app://startUpView";
  static const String webViewPage = "app://webview";
  static const String playViewPage = "app://playview";
  static const String audioPlayDemoPage = "app://audioPlayDemo";

  static Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    return GetPageRoute(
      settings: RouteSettings(name: settings.name),
      page: () => generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget generateView(RouteSettings settings) {
    switch (settings.name) {
      case startUpView:
        return StartUpView();
      case homePage:
        return Page1Demo();
      case webViewPage:
        return Page1Demo();
        break;
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
