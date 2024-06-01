import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 50;

  int get count => _count;
// function for increment
  void setcount() {
    _count++;
    notifyListeners();
  }
}
