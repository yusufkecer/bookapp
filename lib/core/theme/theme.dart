import 'package:bookapp/core/global_key.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData baseLight = ThemeData.light();
  static final ThemeData baseDark = ThemeData.dark();
  static final MyTheme instance = MyTheme();
  static final TextStyle? midText =
      Theme.of(NavigationKey.instance.navigatorKey.currentContext!).textTheme.displayMedium;

  static final TextStyle? verySmall =
      Theme.of(NavigationKey.instance.navigatorKey.currentContext!).textTheme.labelMedium;
}
