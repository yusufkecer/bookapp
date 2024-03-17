import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/project/models/book.dart';
import 'package:bookapp/project/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookList extends ConsumerWidget {
  final List<Book>? _books;

  BookList({books}) : _books = books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Book> book = ref.watch(MyNotifiers.instance.books).books;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
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
    );
  }
}
