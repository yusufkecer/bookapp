import 'package:bookapp/models/notifiers/theme_notifier.dart';
import 'package:bookapp/feature/screens/home_screen.dart';

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
  final libraryTheme = ChangeNotifierProvider<ThemeNotifier>((ref) => ThemeNotifier());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(libraryTheme);

    return MaterialApp(
      title: 'Book Library',
      darkTheme: ThemeData.dark(),
      theme: themeNotifier.darkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
