import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/colors.dart';
import 'package:bookapp/project/models/book.dart';
import 'package:bookapp/project/models/notifiers/book_notifier.dart';
import 'package:bookapp/feature/view/book/book_add.dart';
import 'package:bookapp/core/style.dart';
import 'package:bookapp/project/string.dart';

import 'package:bookapp/project/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class BookDetails extends ConsumerWidget {
  final Book? _book;

  const BookDetails(Book book, {super.key}) : _book = book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookNotifier = ref.read(MyNotifiers.instance.books);
    final themeNotifier = ref.read(MyNotifiers.instance.theme);

    return Scaffold(
      appBar: MediaQuery.of(context).size.width < Layout.wideLayoutThreshold ? _buildAppBar(context) : null,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: BookCover(
                  url: _book?.coverUrl.toString() ?? '',
                  boxFit: BoxFit.fitHeight,
                  height: 325,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 4.0),
                child: Text(
                  '${_book?.title}',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By ',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: '${_book?.author}',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      TextSpan(
                        text: ' in ',
                        style:
                            Theme.of(context).textTheme.caption?.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: '${_book?.category}',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              //! FIXME: Uncomment when StarRating is implemented
              // StarRating(
              //   starCount: 5,
              //   rating: (_book.rating / 2).toDouble(),
              // ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 38.0,
              ),
              Text(
                '${_book?.description}',
                style: TextStyle(
                    color: Theme.of(context).textTheme.caption!.color!.withOpacity(0.85),
                    fontFamily: 'Nunito',
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).size.width > Layout.wideLayoutThreshold
          ? SpeedDial(
              overlayOpacity: 0.25,
              overlayColor: themeNotifier.darkModeEnabled ? Colors.black : Colors.white,
              animatedIcon: AnimatedIcons.home_menu,
              children: [
                _buildSubFab(
                  StringData.delete,
                  Icons.delete,
                  () => _showDeleteDialog(
                    context,
                    ref.read(MyNotifiers.instance.books),
                  ),
                ),
                _buildSubFab(StringData.editBook, Icons.edit,
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookAdd(book: _book)))),
                _buildSubFab(StringData.add, Icons.add,
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BookAdd())))
              ],
            )
          : FloatingActionButton(
              child: const Icon(Icons.delete),
              onPressed: () => _showDeleteDialog(context, bookNotifier),
            ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(StringData.bookDetails),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.edit,
            size: 22.0,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BookAdd(book: _book),
              ),
            );
          },
        ),
      ],
    );
  }

  SpeedDialChild _buildSubFab(String label, IconData iconData, Function() onTap) {
    return SpeedDialChild(
      label: label,
      labelStyle: TextStyle(color: ColorData.kTextTitleColor),
      child: Icon(iconData),
      onTap: onTap,
    );
  }

  void _showDeleteDialog(BuildContext context, BookNotifier bookNotifier) async {
    final dialog = AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('Delete book?'),
      content: Text(
        'This will delete the book from your book list',
        style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
      ),
      actions: [
        ElevatedButton(
          child: const Text(
            'CANCEL',
            // style: TextStyle(
            //   color: Theme.of(context).buttonColor,
            // ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text(
            'ACCEPT',
            // style: TextStyle(
            //   color: Theme.of(context).buttonColor,
            // ),
          ),
          onPressed: () {
            bookNotifier.removeBook(_book!);
            // Pop details screen
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    await showDialog(context: context, builder: (context) => dialog);
  }
}
