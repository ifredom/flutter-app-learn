import 'package:first_flutter_app/ui/pages/page1.dart';
import 'package:first_flutter_app/ui/pages/provider_demo.dart';
import 'package:first_flutter_app/ui/widgets/popupRoute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProviderDemoModel>.reactive(
        viewModelBuilder: () => ProviderDemoModel(),
        builder: (context, model, child) => Scaffold(
              key: _globalKey,
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
                                    bottomRight: Radius.elliptical(60.0, 100.0))),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "导航栏",
                              style: TextStyle(color: Colors.white, fontSize: 25.0),
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
                              pageBuilder: (_, anim1, anim2) => SlideTransition(
                                position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(anim1),
                                child: SamplePage(),
                              ),
                            ),
                          );
                        },
                      ),
                      // UpdateTitleButton(),
                      ElevatedButton(
                        child: Text("加"),
                        onPressed: () {
                          Navigator.of(context).push(MyPopUpRoute(
                            child: SamplePage(),
                          ));

                          model.add();
                        },
                      ),
                      ElevatedButton(
                        child: Text("跳转"),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Page1Demo(),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: Text("减"),
                        onPressed: () {
                          model.reduce();
                        },
                      ),
                      Builder(builder: (context) {
                        return ElevatedButton(
                          child: Text("点击1"),
                          onPressed: () {
                            final scaffold = ScaffoldMessenger.of(context);
                            scaffold.showSnackBar(
                              SnackBar(
                                content: const Text('提示信息'),
                                action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  )
                ],
              ),
            ));
  }

  Widget _buildButton({String title = '按钮', Function callback}) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        callback();
      },
    );
  }

  // ignore: unused_element
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

class BuildTestPartOne extends ViewModelWidget<ProviderDemoModel> {
  BuildTestPartOne({
    Key key,
  }) : super(
          key: key,
        );

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

class BuildTestPartTwo extends ViewModelWidget<ProviderDemoModel> {
  BuildTestPartTwo({
    Key key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context, model) {
    print("_build 第二部分");
    return Text("_buildTestPartTwo: 这里没有刷新");
  }
}

class BuildTestPartThree extends ViewModelWidget<ProviderDemoModel> {
  BuildTestPartThree({
    Key key,
  }) : super(key: key);

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
        height: 300,
        width: 500,
        child: Stack(children: <Widget>[
          Positioned(
            right: -10.0,
            top: -10.0,
            child: Text("X"),
          ),
          ElevatedButton(
            child: Text("关闭"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
      // actions: <Widget>[
      //   TextButton(
      //     child: Text('close'),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ],
    );
  }
}
