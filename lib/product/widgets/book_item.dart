import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/feature/view/book/book_details.dart';
import 'package:bookapp/core/theme/layout.dart';
import 'package:bookapp/product/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookItem extends ConsumerWidget {
  final Book? _book;

  BookItem(this._book, {super.key});
  final book = MyNotifiers.instance.books;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookNotifier = ref.read(book);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (MediaQuery.of(context).size.width > Layout.wideLayoutThreshold) {
          bookNotifier.selectedIndex = bookNotifier.books.indexOf(_book);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetails(_book)));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 25.0),
        height: 160.0,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: BookCover(url: _book!.coverUrl ?? ''),
            ),
            Flexible(
              flex: 6,
              child: Container(
                decoration: bookNotifier.selectedIndex == bookNotifier.books.indexOf(_book) &&
                        MediaQuery.of(context).size.width > Layout.wideLayoutThreshold
                    ? BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 4.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      )
                    : null,
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _book.title!,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          'By ${_book.author}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Text(
                      _book.category!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
