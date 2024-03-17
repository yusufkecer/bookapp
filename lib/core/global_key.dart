import 'package:flutter/material.dart';

class NavigationKey {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final NavigationKey _instance = NavigationKey._internal();
  static NavigationKey get instance => _instance;

  factory NavigationKey() {
    return _instance;
  }

  NavigationKey._internal();
}
