import 'package:fluro/fluro.dart';

import '../router_init.dart';
// import './pages/user/form_renewal.dart';

class UserRouter implements IRouterProvider {
  static String withdrawalPage = "/withdrawal";

  @override
  void initRouter(Router router) {
    // router.define(formWithdrawalPage,
    //     handler: Handler(handlerFunc: (_, params) => Fromwithdrawal()));
  }
}
