import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/style.dart';
import 'package:bookapp/feature/screens/book/book_add.dart';
import 'package:bookapp/models/book.dart';
import 'package:bookapp/feature/screens/book/book_details.dart';
import 'package:bookapp/models/notifiers/theme_notifier.dart';
import 'package:bookapp/project/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookNotifier = ref.read(MyNotifiers.instance.books);
    final themeNotifer = ref.read(MyNotifiers.instance.theme);
    return Scaffold(
      appBar: _buildAppBar(context, themeNotifer, title: Text('Book Library'), ref: ref),
      body: Container(
        child: MediaQuery.of(context).size.width > wideLayoutThreshold
            ? Row(
                children: <Widget>[
                  Flexible(
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
            : BookList(),
      ),
      floatingActionButton: MediaQuery.of(context).size.width < wideLayoutThreshold
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BookAdd()));
              },
            )
          : Container(),
    );
  }

  AppBar _buildAppBar(BuildContext context, ThemeNotifier themeNotifier, {Widget? title, required WidgetRef ref}) {
    return AppBar(
      title: title,
      actions: [
        IconButton(
          icon: themeNotifier.darkModeEnabled ? Icon(Icons.brightness_7) : Icon(Icons.brightness_2),
          color: Theme.of(context).iconTheme.color,
          onPressed: () => themeNotifier.toggleTheme(),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: BookSearch(ref: ref));
          },
        ),
      ],
    );
  }
}

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
        icon: Icon(Icons.clear),
        color: Theme.of(context).iconTheme.color,
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Theme.of(context).iconTheme.color,
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final books = ref.watch(MyNotifiers.instance.books).books;

    final results = books
        .where((book) => book.title.toLowerCase().contains(query) || book.author.toLowerCase().contains(query))
        .toList();

    return BookList(books: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final books = ref.watch(MyNotifiers.instance.books).books;

    final results = books
        .where((book) => book.title.toLowerCase().contains(query) || book.author.toLowerCase().contains(query))
        .toList();

    return BookList(books: results);
  }
}
