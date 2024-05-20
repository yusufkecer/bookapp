import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/product/models/nav_model.dart';
import 'package:bookapp/product/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookList extends ConsumerWidget {
  final List<Book>? _books;

  const BookList({super.key, List<Book>? books}) : _books = books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Book> book = ref.watch(MyNotifiers.instance.books).books;

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Divider(
                  color: Colors.grey.withOpacity(0.3),
                  height: 18.0,
                ),
              );
            }),
            itemCount: book.length,
            itemBuilder: ((context, index) {
              return BookItem(_books?.elementAt(index) ?? book[index]);
            }),
          ),
        ),
        const SizedBox(
          height: NavModel.navBarHeight,
        ),
      ],
    );
  }
}
