import 'package:equatable/equatable.dart';

import 'package:bookapp/product/models/book_history.dart';
import 'package:bookapp/product/util/base/base_firebase_model.dart';

// ignore: must_be_immutable
class Book extends Equatable with FirebaseModel<Book> implements IdModel {
  @override
  String? id;
  String? title;
  String? author;
  String? description;
  String? coverUrl;
  String? category;
  BookHistory? bookHistory;

  Book({this.title, this.author, this.description, this.coverUrl, this.category, this.id, this.bookHistory});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'author': author,
      'description': description,
      'image': coverUrl,
      'category': category,
    };
  }

  @override
  List<Object> get props {
    return [
      id as Object,
      title as Object,
      author as Object,
      description as Object,
      coverUrl as Object,
      category as Object,
    ];
  }

  @override
  Book fromMap(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      coverUrl: json['coverUrl'],
      category: json['category'],
      id: json['id'],
    );
  }

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? description,
    String? coverUrl,
    String? category,
  }) {
    return Book(
      id: id ?? this.id!,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      coverUrl: coverUrl ?? this.coverUrl,
      category: category ?? this.category,
    );
  }
}
