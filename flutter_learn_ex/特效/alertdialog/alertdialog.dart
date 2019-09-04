import 'package:flutter/material.dart';

class IfredomTextField extends StatefulWidget {
  @override
  _IfredomTextFieldState createState() => _IfredomTextFieldState();
}

class _IfredomTextFieldState extends State<IfredomTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      RaisedButton(
          child: Text('alertDialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('提示！'),
                content: Text('前方高能预警'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('取消'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('确定'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )z);
          })
    ]);
  }
}
