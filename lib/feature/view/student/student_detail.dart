import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/widgets/detail_card.dart';
import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final Student stundent;
  const StudentDetail({super.key, required this.stundent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Öğrenci Detayı"),
        backgroundColor: Theme.of(context).cardTheme.color,
      ),
      body: const DetailCard(/*students*/),
    );
  }
}
