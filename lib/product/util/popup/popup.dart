import 'package:bookapp/core/global_key.dart';
import 'package:bookapp/product/string_data/string.dart';
import 'package:flutter/material.dart';

class Popup {
  void generalError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(StringData.error),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(StringData.ok),
            ),
          ],
        );
      },
    );
  }

  static void generalSuccess(String message) {
    showDialog(
      context: NavigationKey.instance.navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text(StringData.success),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(StringData.ok),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> confirmDialog(BuildContext context, String message) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(StringData.confirm),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text(StringData.no),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(StringData.yes),
            ),
          ],
        );
      },
    );
  }
}
