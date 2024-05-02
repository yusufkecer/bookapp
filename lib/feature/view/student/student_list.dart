import 'package:bookapp/feature/view/student/student_detail.dart';
import 'package:bookapp/feature/view/student/student_list_model.dart';
import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/widgets/listtile/custom_listtile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentList extends ConsumerStatefulWidget {
  const StudentList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentListState();
}

class _StudentListState extends StudentListModel {
  @override
  Widget build(BuildContext context) {
    students = ref.read(studentProvider).students;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Öğrenci Listesi'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return PressableListtile(
            title: "Sıla Bulut",
            subtitle: "Sınıfı: 5-D / Numarası:  511",
            leadingIcon: Icons.person,
            trailingIcon: Icons.arrow_forward_ios,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const StudentDetail(
                    stundent: Student(
                      name: "name",
                      surname: "surname",
                      stundentClass: "stundentClass",
                      studentNumber: "studentNumber",
                      id: "1",
                      receivedBooks: [],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
