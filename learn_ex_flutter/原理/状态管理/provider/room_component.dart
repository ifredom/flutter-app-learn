import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_demo.dart';

class ProviderTestPage extends StatefulWidget {
  @override
  _ProviderTestPageState createState() => _ProviderTestPageState();
}

class _ProviderTestPageState extends State<ProviderTestPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("build root");
    return SafeArea(
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
                    print("变化");

                    Navigator.of(context).push(
                      PageRouteBuilder(
                        barrierDismissible: true,
                        maintainState: false,
                        barrierColor: Color.fromRGBO(0, 0, 0, 0.6),
                        opaque: false,
                        pageBuilder: (_, anim1, anim2) => SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(1.0, 0.0), end: Offset.zero)
                              .animate(anim1),
                          child: SamplePage(),
                        ),
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: Text("加"),
                  onPressed: () {
                    final store =
                        Provider.of<ProviderDemoModel>(context, listen: false);
                    store.add();
                  },
                ),
                RaisedButton(
                  child: Text("减"),
                  onPressed: () {
                    final store =
                        Provider.of<ProviderDemoModel>(context, listen: false);
                    store.reduce();
                  },
                ),
                _buildTestPartOne(),
                _buildTestPartTwo(),
              ],
            )
          ],
        ),
      ),
    );
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
        return Text(snapshot.price.toString());
      },
    );
  }

  Widget _buildTestPartTwo() {
    print("_build TestPartTwo");
    final provderDemoData =
        Provider.of<ProviderDemoModel>(context, listen: false);
    print(provderDemoData.price);
    return Text("_buildTestPartTwo: 这里没有刷新");
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // alertDialog要设置狂高，必须要直接包裹SizeBox
    return AlertDialog(
      backgroundColor: Colors.redAccent,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        child: Stack(children: <Widget>[
          RaisedButton(
            child: Text("关闭"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
    );
  }
}
