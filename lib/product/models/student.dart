import 'package:bookapp/product/models/book.dart';
import 'package:bookapp/product/models/book_history.dart';
import 'package:bookapp/product/util/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Student extends Equatable with FirebaseModel<Student> implements IdModel {
  Student({
    this.name,
    this.surname,
    this.stundentClass,
    this.studentNumber,
    this.id,
    this.receivedBooks,
  });

  @override
  List<Object?> get props => [name, surname, stundentClass, studentNumber, id, receivedBooks];

  String? name;
  String? surname;
  String? stundentClass;
  String? studentNumber;
  @override
  String? id;
  List<BookHistory>? receivedBooks;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'class': stundentClass,
      'studentNumber': studentNumber,
    };
  }

  Student copyWith({
    String? name,
    String? surname,
    String? stundentClass,
    String? studentNumber,
    String? id,
    List<BookHistory>? receivedBooks,
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
    );
  }
}
