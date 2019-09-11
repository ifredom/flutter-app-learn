import 'package:first_flutter_app/pages/first_page/first_page.dart';
import 'package:first_flutter_app/pages/transition_page/fade.dart';
import 'package:first_flutter_app/pages/transition_page/hero_A.dart';
import 'package:first_flutter_app/pages/transition_page/rotation.dart';
import 'package:first_flutter_app/pages/transition_page/scale.dart';
import 'package:first_flutter_app/pages/transition_page/size.dart';
import 'package:first_flutter_app/pages/transition_page/slide_X_page.dart';
import 'package:first_flutter_app/pages/transition_page/target_page.dart';
import 'package:first_flutter_app/pages/transition_page/slide_right.dart';
import 'package:first_flutter_app/pages/transition_page/two_transition.dart';
import 'package:flutter/material.dart';

class TranstionRoutePage extends StatefulWidget {
  @override
  _TranstionRoutePageState createState() => _TranstionRoutePageState();
}

class _TranstionRoutePageState extends State<TranstionRoutePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('几种动画类型'),
      ),
      // body: Text('test'),
      body: Container(
        color: Colors.lightBlue,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("滑动动画"),
              onPressed: () {
                Navigator.push(
                    context, SlideRightRoute(page: TargetTestTransition()));
              },
            ),
            RaisedButton(
              child: Text("缩放动画"),
              onPressed: () {
                Navigator.push(
                    context, ScaleRoute(page: TargetTestTransition()));
              },
            ),
            RaisedButton(
              child: Text("旋转动画"),
              onPressed: () {
                Navigator.push(
                    context, RotateRoute(page: TargetTestTransition()));
              },
            ),
            RaisedButton(
              child: Text("大小动画"),
              onPressed: () {
                Navigator.push(
                    context, SizeRoute(page: TargetTestTransition()));
              },
            ),
            RaisedButton(
              child: Text("渐变动画"),
              onPressed: () {
                Navigator.push(
                    context, FadeRoute(page: TargetTestTransition()));
              },
            ),
            RaisedButton(
              child: Text("旋转+缩放动画"),
              onPressed: () {
                Navigator.push(
                    context, TwoTransitionRoute(page: TargetTestTransition()));
              },
            ),
            RaisedButton(
              child: Text("hero飞跃动画"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return HeroAnimationA();
                    // return FirstPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
