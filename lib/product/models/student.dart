import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/product/util/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Student extends Equatable with FirebaseModel<Student> implements IdModel {
  const Student(
      {required this.name,
      required this.surname,
      required this.stundentClass,
      required this.studentNumber,
      required this.id,
      required this.receivedBooks});

  @override
  List<Object?> get props => [name, surname, stundentClass, studentNumber, id, receivedBooks];

  final String? name;
  final String? surname;
  final String? stundentClass;
  final String? studentNumber;
  final String? id;
  final List<Book>? receivedBooks;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'class': stundentClass,
      'studentNumber': studentNumber,
      'id': id,
      'receivedBooks': receivedBooks?.map((x) => x.toMap()).toList(),
    };
  }

  Student copyWith({
    String? name,
    String? surname,
    String? stundentClass,
    String? studentNumber,
    String? id,
    List<Book>? receivedBooks,
  }) {
    return Student(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      stundentClass: stundentClass ?? this.stundentClass,
      studentNumber: studentNumber ?? this.studentNumber,
      id: id ?? this.id,
      receivedBooks: receivedBooks ?? this.receivedBooks,
    );
  }

  @override
  Student fromMap(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      surname: json['surname'],
      stundentClass: json['class'],
      studentNumber: json['studentNumber'],
      id: json['id'],
      receivedBooks: [],
    );
  }
}
