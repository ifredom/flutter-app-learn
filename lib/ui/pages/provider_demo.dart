import 'package:flutter/material.dart';

class ProviderDemoModel with ChangeNotifier {
  int _price = 0;
  int get price => _price;
  int _count = 0;
  int get count => _count;

  bool _disposed = false;

  void add() {
    _price += 1;
    notifyListeners();
  }

  void reduce() {
    _price -= 1;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
