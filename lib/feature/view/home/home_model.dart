import 'package:bookapp/feature/view/home/book_search.dart';
import 'package:bookapp/feature/view/home/home_screen.dart';

import 'package:bookapp/product/util/notifiers/theme_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HomeModel extends ConsumerState<HomeScreen> {
  AppBar buildAppBar(BuildContext context, ThemeNotifier themeNotifier, {Widget? title, required WidgetRef ref}) {
    return AppBar(
      centerTitle: true,
      title: title,
      leading: IconButton(
        icon: themeNotifier.darkModeEnabled ? const Icon(Icons.brightness_7) : const Icon(Icons.brightness_2),
        color: Theme.of(context).iconTheme.color,
        onPressed: () => themeNotifier.toggleTheme(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: BookSearch(ref: ref));
          },
        ),
      ],
    );
  }
}
