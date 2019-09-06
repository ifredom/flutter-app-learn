import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:first_flutter_app/pages/splash.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/otherOne.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

var otherOneHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new PageOtherOne();
});

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new PageSplash();
});
