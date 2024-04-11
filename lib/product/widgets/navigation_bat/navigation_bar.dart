import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/colors.dart';
import 'package:bookapp/core/theme/theme.dart';
import 'package:bookapp/product/models/nav_model.dart';
import 'package:bookapp/product/util/notifiers/nav_notifiers.dart';
import 'package:bookapp/product/widgets/navigation_bat/nav_notch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NavNotifiers data = ref.watch(MyNotifiers.instance.nav);
    return navigationBar(data);
  }

  AnimatedContainer navigationBar(NavNotifiers data) {
    return AnimatedContainer(
      height: 75.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: ColorData.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(data.currentIndex == 0 ? 0.0 : 20.0),
          topRight: Radius.circular(data.currentIndex == NavModel.navBtn.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < NavModel.navBtn.length; i++)
            GestureDetector(
              onTap: () => data.updateIndex(i),
              child: iconBtn(i, data.currentIndex),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i, selectBtn) {
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
              NavModel.navBtn[i].icons!,
              size: 35,
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
