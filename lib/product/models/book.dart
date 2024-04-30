import 'package:bookapp/product/util/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

import 'package:bookapp/product/models/book_history.dart';

// ignore: must_be_immutable
class Book extends Equatable with BaseModel {
  @override
  String? id;
  String title;
  String author;
  String description;
  String coverUrl;
  String category;
  BookHistory? bookHistory;

  Book(this.title, this.author, this.description, this.coverUrl, this.category, this.id, {this.bookHistory});

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
      title,
      author,
      description,
      coverUrl,
      category,
    ];
  }

  @override
  BaseModel<IdModel> fromMap(Map<String, dynamic> map) {
    return Book(
      map['title'],
      map['author'],
      map['description'],
      map['image'],
      map['category'],
      map['id'],
    );
  }
}

final initialBooks = [
  Book(
      'The Doe in the Forest',
      'Laurel Toven',
      'In this book, we have a geographical historical and cultural region in the wester, part of the country of Belgium',
      'https://about.canva.com/wp-content/uploads/sites/3/2015/01/children_bookcover.png',
      'Children',
      "1"),
  Book(
      'Norse Mythology',
      'Neil Gaiman',
      'The immortal #1 New York Times bestseller',
      'https://pro2-bar-s3-cdn-cf3.myportfolio.com/560d16623f9c2df9615744dfab551b3d/e50c016f-b6a8-4666-8fb8-fe6bd5fd9fec_rw_1920.jpeg?h=dc627898fc5eac88aa791fb2b124ecbd',
      'Religion',
      "2"),
  Book('The Sun, the Moon, the Stars', 'Junot Diaz', 'Winner of the Pulitzer Prize',
      'https://i1.sndcdn.com/artworks-000206897848-eylpix-t500x500.jpg', 'Drama', "3"),
];

Book bookToAdd = Book(
    'Harry Potter',
    'JK Rowling',
    'In an age with kings and kings',
    'https://www.harrypotterfanzone.com/article/wp-content/uploads/2018/11/jonny-duddle-goblet-of-fire-cover.png',
    'Fantasy',
    "4");
