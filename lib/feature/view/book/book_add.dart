import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/widgets/buttons/confirm_button.dart';
import 'package:bookapp/product/widgets/inputs/book_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class BookAdd extends StatelessWidget {
  final Book? book;

  const BookAdd({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book == null ? StringData.addBook : StringData.editBook),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: AddBookForm(book: book),
        ),
      ),
    );
  }
}

class AddBookForm extends ConsumerStatefulWidget {
  final Book? book;

  const AddBookForm({super.key, this.book});

  @override
  ConsumerState<AddBookForm> createState() => _AddBookFormState();
}

class _AddBookFormState extends ConsumerState<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  String _description = '';
  String _coverUrl = '';
  String _category = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BookTextFormField(
            labelText: StringData.title,
            errorText: StringData.enterTitle,
            initialValue: widget.book?.title,
            onSaved: (value) => _title = value!,
          ),
          BookTextFormField(
            labelText: StringData.author,
            errorText: StringData.enterAuthor,
            onSaved: (value) => _author = value!,
            initialValue: widget.book?.author,
          ),
          BookTextFormField(
            labelText: StringData.description,
            errorText: StringData.enterDescription,
            initialValue: widget.book?.description,
            onSaved: (value) => _description = value!,
          ),
          BookTextFormField(
            labelText: StringData.coverUrl,
            errorText: StringData.coverUrl,
            initialValue: widget.book?.coverUrl,
            onSaved: (value) => _coverUrl = value!,
          ),
          BookTextFormField(
            labelText: StringData.category,
            errorText: StringData.enterCategory,
            initialValue: widget.book?.category,
            onSaved: (value) => _category = value!,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: ConfirmButton(
              text: widget.book == null ? StringData.addBook : StringData.editBook,
              onPressed: () {
                if (_formKey.currentState == null) {
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final book = Book(
                    title: _title,
                    author: _author,
                    description: _description,
                    coverUrl: _coverUrl,
                    category: _category,
                  );

                  if (widget.book == null) {
                    print("book $book");
                    ref.watch(MyNotifiers.instance.books).addBook(book);
                    Navigator.pop(context);
                  } else {
                    ref.watch(MyNotifiers.instance.books).updateBook(widget.book!, book);
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
