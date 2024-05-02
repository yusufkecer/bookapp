import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/style.dart';
import 'package:bookapp/feature/view/book/book_add.dart';
import 'package:bookapp/feature/view/book/book_list.dart';
import 'package:bookapp/feature/view/student/student_list.dart';
import 'package:bookapp/product/padding/custom_padding.dart';
import 'package:bookapp/product/util/notifiers/nav_notifiers.dart';
import 'package:bookapp/product/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      floatingActionButton: MediaQuery.of(context).size.width < Layout.wideLayoutThreshold
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const ProjectPadding.topTwenty(),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const BookAdd()));
                  },
                ),
              ),
            )
          : Container(),
    );
  }
}
