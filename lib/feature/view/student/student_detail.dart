import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/widgets/listtile/detail_card.dart';
import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final Student student;
  const StudentDetail({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Öğrenci Detayı"),
        backgroundColor: Theme.of(context).cardTheme.color,
      ),
      body: DetailCard(student: student),
    );
  }
}
