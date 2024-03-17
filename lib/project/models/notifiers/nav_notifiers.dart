import 'package:flutter/material.dart';

class NavNotifiers extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    print("updateIndex $index");
    print("updateIndex $_currentIndex");
    _currentIndex = index;
    print("after $index");
    print("after $_currentIndex");
    notifyListeners();
  }
}
