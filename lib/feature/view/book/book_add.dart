import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/models/book.dart';
import 'package:bookapp/project/widgets/buttons/confirm_button.dart';
import 'package:bookapp/project/widgets/inputs/book_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookAdd extends StatelessWidget {
  final Book? book;

  BookAdd({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book == null ? 'Add a book' : 'Update book'),
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

  AddBookForm({this.book});

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends ConsumerState<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  var _title = '';
  var _author = '';
  var _description = '';
  var _rating;
  var _coverUrl = '';
  var _category = '';

  @override
  void initState() {
    super.initState();
    _rating = widget.book?.rating ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          BookTextFormField(
            labelText: 'Title',
            errorText: 'Enter a book title',
            initialValue: widget.book?.title,
            onSaved: (value) => _title = value!,
          ),
          BookTextFormField(
            labelText: 'Author',
            errorText: 'Enter an author',
            onSaved: (value) => _author = value!,
            initialValue: widget.book?.author,
          ),
          BookTextFormField(
            labelText: 'Description',
            errorText: 'Enter a description',
            initialValue: widget.book?.description,
            onSaved: (value) => _description = value!,
          ),
          BookTextFormField(
            labelText: 'Cover url',
            errorText: 'Enter a cover url',
            initialValue: widget.book?.coverUrl,
            onSaved: (value) => _coverUrl = value!,
          ),
          BookTextFormField(
            labelText: 'Category',
            errorText: 'Enter a category',
            initialValue: widget.book?.category,
            onSaved: (value) => _category = value!,
          ),
          InputDecorator(
            decoration: InputDecoration(
              labelText: 'Rating',
              labelStyle: TextStyle(color: Colors.grey),
              suffixIcon: Chip(
                label: Text(_rating.toStringAsFixed(1)),
              ),
            ),
            child: Slider(
              value: _rating.roundToDouble(),
              min: 0.0,
              max: 10.0,
              divisions: 10,
              onChanged: (value) => setState(() => _rating = value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: ConfirmButton(
              text: widget.book == null ? 'Add Book' : 'Update Book',
              onPressed: () {
                if (_formKey.currentState == null) {
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final book = Book(_title, _author, _description, _coverUrl, _category, _rating);

                  if (widget.book == null) {
                    ref.watch(MyNotifiers.instance.books).removeBook(book);
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
