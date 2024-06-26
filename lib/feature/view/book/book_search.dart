import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/product/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookSearch extends SearchDelegate<Book> {
  WidgetRef ref;
  BookSearch({required this.ref});
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        color: Theme.of(context).iconTheme.color,
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      color: Theme.of(context).iconTheme.color,
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final books = ref.watch(MyNotifiers.instance.books).books;

    final results = books
        .where((book) => book.title!.toLowerCase().contains(query) || book.author!.toLowerCase().contains(query))
        .toList();

    return BookList(books: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final books = ref.watch(MyNotifiers.instance.books).books;

    final results = books
        .where((book) => book.title!.toLowerCase().contains(query) || book.author!.toLowerCase().contains(query))
        .toList();

    return BookList(books: results);
  }
}
