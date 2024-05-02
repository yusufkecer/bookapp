import 'package:bookapp/product/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class BookNotifier extends ChangeNotifier {
  static final BookNotifier _instance = BookNotifier._internal();
  factory BookNotifier() => _instance;
  BookNotifier._internal();

  CollectionReference booksCollection = FirebaseFirestore.instance.collection('book');

  List<Book>? _books;
  List<Book> get books => _books ?? [];
  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void initBook() {
    booksCollection.get().then((value) {
      _books = value.docs.map((e) => Book().fromMap(e.data() as Map<String, dynamic>)).toList();
      notifyListeners();
    });
    notifyListeners();
  }

  Book addBook(Book book) {
    if (_books == null) {
      return book;
    }
    books = (_books!..add(book));
    booksCollection.add(book.toMap());
    return book;
  }

  Book removeBook(Book book) {
    if (_books == null) {
      return book;
    }
    books = (_books!..remove(book));
    booksCollection.doc(book.id).delete();
    return book;
  }

  Book updateBook(Book oldBook, Book newBook) {
    oldBook.author = newBook.author;
    oldBook.category = newBook.category;
    oldBook.coverUrl = newBook.coverUrl;
    oldBook.description = newBook.description;
    oldBook.title = newBook.title;

    final index = books.indexOf(oldBook);

    books[index] = newBook;
    notifyListeners();
    return newBook;
  }
}
