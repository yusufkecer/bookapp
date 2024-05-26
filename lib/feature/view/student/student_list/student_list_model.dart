import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/feature/view/student/student_list/student_list.dart';
import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/util/loading/book_loading.dart';
import 'package:bookapp/product/util/notifiers/student_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StudentListModel extends ConsumerState<StudentList> {
  List<Student>? students = [];

  bool? loading;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStudents();
    });
    super.initState();
  }

  Future<void> getStudents() async {
    Loading.instance.showBookLoading();
    ProviderBase<StudentNotifier> studentProvider = MyNotifiers.instance.student;
    StudentNotifier studentNotifier = ref.watch(studentProvider);
    loading = studentNotifier.isLoading;
    await studentNotifier.getFirebase();
    students = studentNotifier.students;
    Loading.instance.hideLoading();
  }
}
