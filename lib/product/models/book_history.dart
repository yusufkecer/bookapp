import 'package:equatable/equatable.dart';

class BookHistory extends Equatable {
  final String id;
  final String receiptDate;
  final String returnDate;
  final String studentId;
  final String isReturned;

  const BookHistory({
    required this.id,
    required this.receiptDate,
    required this.returnDate,
    required this.studentId,
    required this.isReturned,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
