import 'package:flutter/material.dart';

class NavNotifiers extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    notifyListeners();
    _currentIndex = index;
    notifyListeners();
  }
}
