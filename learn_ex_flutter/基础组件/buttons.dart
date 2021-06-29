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
        Center(
          child: Text("按钮以及升级到flutter2.0"),
        ),
        ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: () {
            print('test');
          },
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.send),
          style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(color: Color.fromRGBO(55, 1, 200, 1)))),
          label: Text("ElevatedButton.icon"),
          onPressed: () {
            print('test');
          },
        ),
        TextButton(
          child: Text('TextButton'),
          onPressed: () {
            print('flatbutton');
          },
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
          child: Text('OutlinedButton 形状'),
          onPressed: () {
            print('flatbutton');
          },
        ),
      ],
    );
  }
}
