import 'package:bookapp/core/my_notifiers.dart';
import 'package:bookapp/feature/view/student/student_detail.dart';
import 'package:bookapp/feature/view/student/student_list/student_list_model.dart';

import 'package:bookapp/product/string_data/string.dart';
import 'package:bookapp/product/widgets/error.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringData.studentList),
      ),
      body: loading == true || loading == null
          ? const SizedBox.shrink()
          : loading == false && students == null
              ? const CustomError()
              : studentList(),
    );
  }

  ListView studentList() {
    return ListView.builder(
      itemCount: ref.watch(MyNotifiers.instance.student).students.length,
      itemBuilder: (context, index) {
        if (students!.last == students![index]) {
          return Column(
            children: [
              studentDetails(index, context),
              const SizedBox(
                height: 100,
              ),
            ],
          );
        }
        return studentDetails(index, context);
      },
    );
  }

  PressableListtile studentDetails(int index, BuildContext context) {
    return PressableListtile(
      title: "${students![index].name!} ${students![index].surname!}",
      subtitle: "Sınıfı: ${students![index].stundentClass!}",
      leadingIcon: Icons.person,
      trailingIcon: Icons.arrow_forward_ios,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StudentDetail(student: students![index]),
          ),
        );
      },
    );
  }
}
