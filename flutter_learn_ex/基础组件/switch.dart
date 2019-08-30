import 'package:flutter/material.dart';

class IfredomWidget extends StatefulWidget {
  @override
  _IfredomWidgetState createState() => _IfredomWidgetState();
}

class _IfredomWidgetState extends State<IfredomWidget> {
  bool _switch = false;
  bool _checkbox = false;
  double _slider = 0;
  var timeDilation =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: _switch,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeTrackColor: Colors.green,
          activeThumbImage: AssetImage("images/image/advator.jpg"),
          onChanged: (val) {
            print(val);
            setState(() {
              _switch = val;
            });
          },
        ),
        Checkbox(
          value: _checkbox,
          tristate: true,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (val) {
            print(val);
            setState(() {
              _checkbox = val;
            });
          },
        ),
        Slider(
          value: _slider,
          onChanged: (val) {
            print(val);
              setState(() {
              _slider = val;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('选项一'),
          value: timeDilation != 1,
          onChanged: (bool value) {
            setState(() { timeDilation = value ? 10 : 1; });
          },
          secondary: const Icon(Icons.wrap_text),
        ),
        CheckboxListTile(
          title: const Text('选项二'),
          value: timeDilation != 1,
          onChanged: (bool value) {
            setState(() { timeDilation = value ? 10 : 1; });
          },
          secondary: const Icon(Icons.wrap_text),
        )
      ],
    );
  }
}
