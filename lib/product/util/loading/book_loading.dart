import 'package:bookapp/core/global_key.dart';
import 'package:bookapp/product/string_data/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading {
  NavigationKey navigationKey = NavigationKey.instance;

  //singleton
  static final Loading instance = Loading._internal();

  factory Loading() {
    return instance;
  }

  Loading._internal();

  void showBookLoading() {
    checkContext();
    showDialog(
      context: navigationKey.navigatorKey.currentContext!,
      builder: (context) {
        return Center(
          child: Lottie.asset(
            ProjectAssets.bookLoading,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }

  //hide dialog
  void hideLoading() {
    checkContext();
    Navigator.of(navigationKey.navigatorKey.currentContext!).pop();
  }

  void checkContext() {
    if (navigationKey.navigatorKey.currentContext == null) {
      throw "Context is null";
    }
  }
}
