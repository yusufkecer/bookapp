import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/style.dart';
import 'package:bookapp/feature/view/book/book_add.dart';

import 'package:bookapp/feature/view/home/home_model.dart';

import 'package:bookapp/feature/view/book/book_details.dart';
import 'package:bookapp/product/padding/custom_padding.dart';

import 'package:bookapp/product/util/notifiers/book_notifier.dart';

import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/widgets/book_list.dart';
import 'package:bookapp/product/widgets/navigation_bat/navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeModel {
  BookNotifier? bookNotifier;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookNotifier = ref.read(MyNotifiers.instance.books);
      bookNotifier!.initBook();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifer = ref.read(MyNotifiers.instance.theme);

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
                          bookNotifier!.books[bookNotifier!.selectedIndex],
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
