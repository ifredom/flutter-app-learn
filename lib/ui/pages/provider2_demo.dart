import 'package:flutter/material.dart';

class Provider2DemoModel with ChangeNotifier {
  String _title = 'flutter';
  String get title => _title;
  void setTitle(newTitle) {
    _title = ' ifredom title ';
    notifyListeners();
  }
}
