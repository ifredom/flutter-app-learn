import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String otherOne = '/otherOne';

  static void configureRoutes(Router router) {
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(otherOne, handler: otherOneHandler);
  }
}
