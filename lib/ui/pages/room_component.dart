import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_widget.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'provider_demo.dart';
import 'page1.dart';

class RootComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProviderDemoModel>.withConsumer(
        viewModel: ProviderDemoModel(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                body: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.elliptical(60.0, 100.0),
                                      bottomRight:
                                          Radius.elliptical(60.0, 100.0))),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "导航栏",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ))
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        _buildButton(
                          title: '打开自定义dialog',
                          callback: () {
                            model.add();

                            Navigator.of(context).push(
                              PageRouteBuilder(
                                barrierDismissible: true,
                                maintainState: false,
                                barrierColor: Color.fromRGBO(0, 0, 0, 0.6),
                                opaque: false,
                                pageBuilder: (_, anim1, anim2) =>
                                    SlideTransition(
                                  position: Tween<Offset>(
                                          begin: Offset(1.0, 0.0),
                                          end: Offset.zero)
                                      .animate(anim1),
                                  child: SamplePage(),
                                ),
                              ),
                            );
                          },
                        ),
                        // UpdateTitleButton(),
                        RaisedButton(
                          child: Text("加"),
                          onPressed: () {
                            Navigator.of(context).push(MyPopUpRoute(
                              child: SamplePage(),
                            ));

                            model.add();
                          },
                        ),
                        RaisedButton(
                          child: Text("跳转"),
                          onPressed: () {
                            Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (_) => Page1Demo(),
                              ),
                            );
                          },
                        ),
                        RaisedButton(
                          child: Text("减"),
                          onPressed: () {
                            model.reduce();
                          },
                        ),
                        BuildTestPartOne(),
                        BuildTestPartTwo(),
                        BuildTestPartThree(),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  Widget _buildButton({String title = '按钮', Function callback}) {
    return RaisedButton(
      child: Text(title),
      onPressed: () {
        callback();
      },
    );
  }

  Widget _buildTestPartOne() {
    print("_build TestPartOne");
    return Consumer(
      builder: (context, ProviderDemoModel snapshot, child) {
        print("_root  partOne 内部");
        return Text(snapshot.price.toString());
      },
    );
  }
}

class BuildTestPartOne extends ProviderWidget<ProviderDemoModel> {
  BuildTestPartOne({
    Key key,
  }) : super(key: key, listen: false);

  @override
  Widget build(BuildContext context, model) {
    print("_build 第一部分");
    return Consumer<ProviderDemoModel>(
      builder: (context, snapshot, child) {
        print("_root  partOne 内部");
        return Text(snapshot.price.toString());
      },
    );
  }
}

class MyPopUpRoute extends PopupRoute {
  Widget child;
  MyPopUpRoute({
    @required this.child,
  });

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "modalBarrierDismissLabel";
  // String get barrierLabel => MaterialLocalizations.of(context).modalBarrierDismissLabel;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }
}

class BuildTestPartTwo extends ProviderWidget<ProviderDemoModel> {
  BuildTestPartTwo({
    Key key,
  }) : super(key: key, listen: false);

  @override
  Widget build(BuildContext context, model) {
    print("_build 第二部分");
    return Text("_buildTestPartTwo: 这里没有刷新");
  }
}

class BuildTestPartThree extends ProviderWidget<ProviderDemoModel> {
  BuildTestPartThree({
    Key key,
  }) : super(key: key, listen: true);

  @override
  Widget build(BuildContext context, model) {
    print("_build 第三部分");
    return Text("BuildTestPartThree: ${model.price}");
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // alertDialog要设置狂高，必须要直接包裹SizeBox
    return AlertDialog(
      // backgroundColor: Colors.redAccent,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        child: Stack(children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: Text("X"),
          ),
          RaisedButton(
            child: Text("关闭"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
      // actions: <Widget>[
      //   FlatButton(
      //     child: Text('close'),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ],
    );
  }
}
