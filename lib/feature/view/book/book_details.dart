import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/core/theme/colors.dart';
import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/product/util/notifiers/book_notifier.dart';
import 'package:bookapp/feature/view/book/book_add.dart';
import 'package:bookapp/core/theme/layout.dart';
import 'package:bookapp/product/string_data/string.dart';

import 'package:bookapp/product/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class BookDetails extends ConsumerWidget {
  final Book? _book;

  const BookDetails(Book book, {super.key}) : _book = book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                          text: 'Yazar ',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        TextSpan(
                          text: '${_book?.author}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        TextSpan(
                          text: ' tür ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '${_book?.category}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  height: 38.0,
                ),
                Text(
                  '${_book?.description}',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium!.color!.withOpacity(0.85),
                      fontFamily: 'Nunito',
                      fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          overlayOpacity: 0.25,
          overlayColor: themeNotifier.darkModeEnabled ? Colors.black : Colors.white,
          animatedIcon: AnimatedIcons.menu_arrow,
          activeIcon: Icons.close,
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
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(StringData.bookDetails),
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
      labelStyle: const TextStyle(color: ColorData.kTextTitleColor),
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
        style: TextStyle(color: Theme.of(context).textTheme.titleMedium?.color),
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
