import 'package:first_flutter_app/locator.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final FlutterErrorDetails details;

  ErrorPage(this.details);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  final TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF24292E),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
            gradient: RadialGradient(
              tileMode: TileMode.mirror,
              radius: 0.1,
              colors: [
                Colors.white.withAlpha(10),
                Color(0xFF24292E),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(400 / 2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/ifredom.jpg"),
                width: 90.0,
                height: 90.0,
              ),
              SizedBox(
                height: 11.0,
              ),
              Material(
                child: Text(
                  'Error Occur',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                color: Color(0xFF24292E),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: Color(0xFF24292E),
                    onPressed: _errorReport,
                    child: Text('Report'),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Back'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _errorReport() {
    String content = '${widget.details.exception.toString()}\n${widget.details.stack.toString()}';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              color: Colors.yellowAccent,
              child: Text(content),
            ),
          );
        });
  }
}
