import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/theme.dart';
import 'package:bookapp/feature/view/home_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      ProviderScope(
        child: BookLibrary(),
      ),
    );

class BookLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialAppWithTheme();
  }
}

class MaterialAppWithTheme extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(MyNotifiers.instance.theme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Book Library",
      darkTheme: ThemeData.dark(),
      theme: themeNotifier.darkModeEnabled ? MyTheme.baseDark : MyTheme.baseLight,
      home: HomeScreen(),
    );
  }
}
