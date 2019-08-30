import 'package:flutter/material.dart';

// 创建枚举类型
enum SingingCharacter { lafayette, jefferson }
enum Status {
  none,
  running,
  stopped,
  paused
}

class IfredomWidget extends StatefulWidget {
  IfredomWidget({Key key}) : super(key: key);
  @override
  _IfredomWidgetState createState() => _IfredomWidgetState();
}

class _IfredomWidgetState extends State<IfredomWidget> {
  bool _switch = false;
  bool _checkbox = false;
  double _slider = 0;
  int timeDilation = 0;

  bool _isSelected = true;
  SingingCharacter _character = SingingCharacter.lafayette;

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

            print(Status.values);
            Status.values.forEach((v) => print('value: $v, index: ${v.index}'));
            print('running: ${Status.running}, ${Status.running.index}');
            print('running index: ${Status.values[1]}');

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
          dense: false,
          onChanged: (bool value) {
            setState(() {
              timeDilation = value ? 10 : 1;
            });
          },
          secondary: const Icon(Icons.wrap_text),
        ),
        CheckboxListTile(
          title: const Text('选项二'),
          value: timeDilation != 1,
          onChanged: (bool value) {
            setState(() {
              timeDilation = value ? 10 : 1;
            });
          },
          secondary: const Icon(Icons.wrap_text),
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Lafayette'),
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Thomas Jefferson'),
          value: SingingCharacter.jefferson,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
        new LabeledCheckbox(
          label: 'This is the label text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        ),
      ],
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
