import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('page1 build');
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
            RaisedButton(
              child: Text('Materia组件属性： transparency'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    barrierDismissible: true,
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
          ],
        ),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.black12,
      content: SizedBox(
        // height: MediaQuery.of(context).size.height / 2,
        // width: MediaQuery.of(context).size.width / 2,
        child: Stack(children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Hello world"),
          ),
          Align(
            alignment: Alignment(1.4, -1.4),
            child: GestureDetector(
              child: Container(child: Text('close')),
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print("object");
              },
            ),
          )
        ]),
      ),
    );
  }
}
