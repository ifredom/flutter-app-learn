import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DateSelectedDialogDemo extends StatefulWidget {
  DateSelectedDialogDemo({Key key}) : super(key: key);
  @override
  _DateSelectedDialogDemoState createState() => _DateSelectedDialogDemoState();
}

class _DateSelectedDialogDemoState extends State<DateSelectedDialogDemo> {
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget contentWrapper() {
    const String MIN_DATETIME = '2010-05-12';
    const String MAX_DATETIME = '2021-11-25';
    const String INIT_DATETIME = '2019-05-17';
    const String DATE_FORMAT = 'MM|d,yyyy';
    return Container(
      width: MediaQuery.of(context).size.width * 0.423,
      padding: EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: 1.1,
        child: DatePickerWidget(
          minDateTime: DateTime.parse(MIN_DATETIME),
          maxDateTime: DateTime.parse(MAX_DATETIME),
          initialDateTime: DateTime.parse(INIT_DATETIME),
          dateFormat: DATE_FORMAT,
          pickerTheme: DateTimePickerTheme(
            cancel: Text('取消'),
            confirm: Text('确定'),
            pickerHeight: 300.0,
            titleHeight: 24.0,
            itemHeight: 30.0,
          ),
          onChange: (dateTime, selectedIndex) {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: contentWrapper(),
    );
  }
}
