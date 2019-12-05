import 'package:flutter/material.dart';

class IfredomWidget extends StatelessWidget {
  const IfredomWidget({
    Key key,
    this.text: 'default text',
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text("normal"),
          onPressed: () {
            print('test');
          },
        ),
        RaisedButton.icon(
          icon: Icon(Icons.send),
          color: Color.fromRGBO(55, 1, 200, 1),
          label: Text("normal"),
          onPressed: () {
            print('test');
          },
        ),
        FlatButton(
          color: Colors.blue[700],
          highlightColor: Colors.black87,
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text('flatbutton'),
          onPressed: () {
            print('flatbutton');
          },
        ),
        OutlineButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Text('flatbutton'),
          onPressed: () {
            print('flatbutton');
          },
        ),
      ],
    );
  }
}
