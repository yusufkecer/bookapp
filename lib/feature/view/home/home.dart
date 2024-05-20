import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/colors.dart';
import 'package:bookapp/feature/view/book/book_add.dart';
import 'package:bookapp/feature/view/book/book_list.dart';
import 'package:bookapp/feature/view/student/student_add/student_add.dart';
import 'package:bookapp/feature/view/student/student_list/student_list.dart';
import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/util/notifiers/nav_notifiers.dart';
import 'package:bookapp/product/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final navModel = MyNotifiers.instance.nav;

  @override
  Widget build(BuildContext context) {
    NavNotifiers nav = ref.watch(MyNotifiers.instance.nav);
    return Scaffold(
        body: Stack(
          children: [
            nav.currentIndex == 0 ? const BookListView() : const StudentList(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SpeedDial(
            direction: SpeedDialDirection.up,
            spaceBetweenChildren: 10,
            overlayColor: ColorData.kPrimaryColor.withOpacity(0.2),

            icon: Icons.add,
            activeIcon: Icons.close,

            switchLabelPosition: true,

            children: [
              _buildSubFab(StringData.addBook, Icons.book, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BookAdd(),
                  ),
                );
              }),
              _buildSubFab(StringData.studentAdd, Icons.person_add, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StudentAddView(),
                  ),
                );
              }),
            ],
            // child: FloatingActionButton(
            //   child: const Icon(Icons.add),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (_) => const BookAdd()));
            //   },
            // ),
          ),
        ));
  }

  SpeedDialChild _buildSubFab(String label, IconData iconData, Function() onTap) {
    return SpeedDialChild(
      label: label,
      child: Icon(iconData),
      onTap: onTap,
    );
  }
}
