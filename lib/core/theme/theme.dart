import 'package:bookapp/core/global_key.dart';
import 'package:flutter/material.dart';

@immutable
class MyTheme {
  static final ThemeData baseLight = ThemeData.light();
  static final ThemeData baseDark = ThemeData.dark();
  static final MyTheme instance = MyTheme();
  static final TextStyle? midText =
      Theme.of(NavigationKey.instance.navigatorKey.currentContext!).textTheme.displayMedium;
  static final TextStyle? titleMid =
      Theme.of(NavigationKey.instance.navigatorKey.currentContext!).textTheme.titleMedium;
  static final TextStyle? verySmall =
      Theme.of(NavigationKey.instance.navigatorKey.currentContext!).textTheme.labelLarge;

  static final TextStyle? titleBigGrey = Theme.of(NavigationKey.instance.navigatorKey.currentContext!)
      .textTheme
      .labelLarge
      ?.copyWith(color: Colors.grey, fontSize: 30);
}
