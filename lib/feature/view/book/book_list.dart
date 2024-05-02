import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/style.dart';

import 'package:bookapp/feature/view/book/book_list_model.dart';

import 'package:bookapp/feature/view/book/book_details.dart';

import 'package:bookapp/product/util/notifiers/book_notifier.dart';

import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/widgets/book_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookListView extends ConsumerStatefulWidget {
  const BookListView({super.key});

  @override
  ConsumerState<BookListView> createState() => _HomeScreenState();
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
      body: Container(
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
    );
  }
}
