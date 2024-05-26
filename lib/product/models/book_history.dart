import 'package:bookapp/product/util/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class BookHistory extends Equatable implements IdModel {
  @override
  final String id;
  final String receiptDate;
  final String returnDate;
  final String bookName;
  final String author;

  const BookHistory({
    required this.id,
    required this.receiptDate,
    required this.returnDate,
    required this.bookName,
    required this.author,
  });

  @override
  List<Object?> get props => [id, receiptDate, returnDate, bookName, author];
}
