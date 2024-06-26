import 'package:bookapp/feature/view/book/book_search.dart';
import 'package:bookapp/feature/view/book/book_home_screen_view.dart';

import 'package:bookapp/product/util/notifiers/theme_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HomeModel extends ConsumerState<HomeScreenView> {
  AppBar buildAppBar(BuildContext context, ThemeNotifier themeNotifier, {Widget? title, required WidgetRef ref}) {
    return AppBar(
      centerTitle: true,
      title: title,
      //dark mode button
      // leading: IconButton(
      //   icon: themeNotifier.darkModeEnabled ? const Icon(Icons.brightness_7) : const Icon(Icons.brightness_2),
      //   color: Theme.of(context).iconTheme.color,
      //   onPressed: () => themeNotifier.toggleTheme(),
      // ),
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
