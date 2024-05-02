import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/feature/view/student/student_list.dart';
import 'package:bookapp/product/models/student.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StudentListModel extends ConsumerState<StudentList> {
  List<Student> students = [];
  final studentProvider = MyNotifiers.instance.student;
}
