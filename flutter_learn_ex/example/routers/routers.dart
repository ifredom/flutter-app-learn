import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String first = '/first';
  static const String second = '/second';
  static const String third = '/third';

  static void configureRoutes(Router router) {
    router.define(splash, handler: splashPageHandler);
    router.define(home, handler: homeHandler);
    router.define(first, handler: firstPageHandler);
    router.define(second, handler: secondPageHandler);
    router.define(third, handler: thirdPageHandler);
  }
}
