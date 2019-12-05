import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

enum SexEnum { man, women }

class SetAddressDialog extends StatefulWidget {
  SetAddressDialog({Key key}) : super(key: key);
  @override
  _SetAddressDialogState createState() => _SetAddressDialogState();
}

class _SetAddressDialogState extends State<SetAddressDialog> {
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  DateTime _dateTime;

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
      // color: Colors.white54,
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
          onChange: (dateTime, selectedIndex) {
            setState(() {
              _dateTime = dateTime;
            });
          },
        ),
      ),
    );
  }
  // Widget contentWrapper() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.423,
  //     // color: Colors.white54,
  //     padding: EdgeInsets.all(20),
  //     child: AspectRatio(
  //       aspectRatio: 1.56,
  //       child: CupertinoDatePicker(
  //         mode: CupertinoDatePickerMode.date,
  //         onDateTimeChanged: (result) {},
  //       ),
  //     ),
  //   );
  // }

  // Widget contentWrapper() {
  //   //下划线widget预定义以供复用。
  //   Widget divider1 = Divider(
  //     color: Colors.blue,
  //   );
  //   Widget divider2 = Divider(color: Colors.green);

  //   return Container(
  //     width: MediaQuery.of(context).size.width * 0.423,
  //     // color: Colors.white54,
  //     padding: EdgeInsets.all(20),
  //     child: AspectRatio(
  //         aspectRatio: 1.56,
  //         child: Row(
  //           children: <Widget>[
  //             Expanded(
  //               flex: 1,
  //               child: ListView.separated(
  //                 itemCount: 100,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return Text(
  //                     "$index",
  //                     textAlign: TextAlign.center,
  //                   );
  //                 },
  //                 //分割器构造器
  //                 separatorBuilder: (BuildContext context, int index) {
  //                   return index % 2 == 0 ? divider1 : divider2;
  //                 },
  //               ),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: ListView.builder(
  //                   itemCount: 100,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return Text(
  //                       "$index",
  //                       textAlign: TextAlign.center,
  //                     );
  //                   }),
  //             ),
  //             Expanded(
  //               flex: 1,
  //               child: ListView.separated(
  //                 itemCount: 100,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return Text(
  //                     "$index",
  //                     textAlign: TextAlign.center,
  //                   );
  //                 },
  //                 //分割器构造器
  //                 separatorBuilder: (BuildContext context, int index) {
  //                   return index % 2 == 0 ? divider1 : divider2;
  //                 },
  //               ),
  //             ),
  //           ],
  //         )),
  //   );
  // }

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
