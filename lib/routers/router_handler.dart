import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:first_flutter_app/pages/splash_page/splash.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/first_page/first_page.dart';
import 'package:first_flutter_app/pages/second_page/second_page.dart';
import 'package:first_flutter_app/pages/third_page/third.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

// 启动页
var splashPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new SplashPage();
  },
);

var firstPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new FirstPage();
});

var thirdPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ThirdPage();
});

var secondPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SecondPage(
    userName: 'testParam',
  );
});
