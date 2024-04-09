import 'package:bookapp/core/global_key.dart';
import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/theme.dart';
import 'package:bookapp/feature/view/home/home_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: BookLibrary(),
      ),
    );


class BookLibrary extends StatelessWidget {
  const BookLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialAppWithTheme();
  }
}

class MaterialAppWithTheme extends ConsumerWidget {
  const MaterialAppWithTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(MyNotifiers.instance.theme);

    return MaterialApp(
      navigatorKey: NavigationKey.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Book Library",
      darkTheme: ThemeData.dark(),
      theme: themeNotifier.darkModeEnabled ? MyTheme.baseDark : MyTheme.baseLight,
      home: const HomeScreen(),
    );
  }
}
