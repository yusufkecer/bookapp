import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/style.dart';
import 'package:bookapp/core/theme/colors.dart';

import 'package:bookapp/feature/view/home/home_model.dart';

import 'package:bookapp/feature/view/book/book_details.dart';
import 'package:bookapp/project/models/nav_model.dart';
import 'package:bookapp/project/models/notifiers/nav_notifiers.dart';

import 'package:bookapp/project/string.dart';
import 'package:bookapp/project/widgets/book_list.dart';
import 'package:bookapp/project/widgets/navigation_bat/navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeModel {
  @override
  Widget build(BuildContext context) {
    final bookNotifier = ref.read(MyNotifiers.instance.books);
    final themeNotifer = ref.read(MyNotifiers.instance.theme);
    bookNotifier.initBook();
    return Scaffold(
      appBar: buildAppBar(context, themeNotifer, title: const Text(StringData.library), ref: ref),
      body: Stack(
        children: [
          Container(
            child: MediaQuery.of(context).size.width > Layout.wideLayoutThreshold
                ? Row(
                    children: <Widget>[
                      const Flexible(
                        flex: 4,
                        child: BookList(),
                      ),
                      Flexible(
                        flex: 6,
                        child: BookDetails(
                          bookNotifier.books[bookNotifier.selectedIndex],
                        ),
                      ),
                    ],
                  )
                : const BookList(),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(),
          )
        ],
      ),

      // floatingActionButton: MediaQuery.of(context).size.width < Layout.wideLayoutThreshold
      //     ? FloatingActionButton(
      //         child: Icon(Icons.add),
      //         onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (_) => BookAdd()));
      //         },
      //       )
      //     : Container(),
    );
  }

  AnimatedContainer navigationBar(WidgetRef ref) {
    NavNotifiers data = ref.read(MyNotifiers.instance.nav);

    int currentIndex = data.currentIndex;
    return AnimatedContainer(
      height: 70.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: ColorData.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(currentIndex == 0 ? 0.0 : 20.0),
          topRight: Radius.circular(currentIndex == NavModel.navBtn.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < NavModel.navBtn.length; i++)
            GestureDetector(
              onTap: () {
                data.updateIndex(i);
                setState(() {});
              },
              child: iconBtn(i, currentIndex),
            ),
        ],
      ),
    );
  }
}
