import 'package:bookapp/core/theme/colors.dart';
import 'package:bookapp/core/theme/theme.dart';
import 'package:bookapp/feature/view/home/book_search.dart';
import 'package:bookapp/feature/view/home/home_screen.dart';
import 'package:bookapp/product/models/nav_model.dart';
import 'package:bookapp/product/util/notifiers/theme_notifier.dart';
import 'package:bookapp/product/widgets/navigation_bat/nav_notch.dart';
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

  SizedBox iconBtn(int i, int selectBtn) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 60.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              NavModel.navBtn[i].icons,
              color: isActive ? ColorData.selectColor : ColorData.black,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              NavModel.navBtn[i].name!,
              style: isActive ? MyTheme.verySmall?.copyWith(color: ColorData.selectColor) : MyTheme.verySmall,
            ),
          )
        ],
      ),
    );
  }
}
