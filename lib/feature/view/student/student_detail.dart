import 'package:bookapp/feature/view/student/student_list/student_detail_model.dart';
import 'package:bookapp/product/models/student.dart';
import 'package:bookapp/product/util/error/page_error.dart';
import 'package:bookapp/product/widgets/listtile/basic_listtile.dart';
import 'package:bookapp/product/widgets/listtile/detail_card.dart';
import 'package:bookapp/product/widgets/openable_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentDetail extends ConsumerStatefulWidget {
  final Student? student;
  const StudentDetail({super.key, required this.student});

  @override
  ConsumerState<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends StudentDetailModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Öğrenci Detayı"),
        backgroundColor: Theme.of(context).cardTheme.color,
      ),
      body: widget.student == null
          ? const BasicError(errMessage: "Öğrenci bilgisi alınırken hata oluştu.")
          : SingleChildScrollView(
              child: Column(
                children: [
                  DetailCard(student: widget.student!),
                  OpenableListiView(
                    height: 250,
                    child: oldBooks(),
                  ),
                ],
              ),
            ),
    );
  }

  ListView oldBooks() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1, //widget.student.receivedBooks!.length,
      itemBuilder: (BuildContext context, int index) {
        return const Column(
          children: [
            Row(
              children: [
                BasicListtile(
                    title: "Kitap Adı", subtitle: " widget.student.receivedBooks![index].bookName", icon: Icons.book),
                BasicListtile(
                    title: "Yazar", subtitle: " widget.student.receivedBooks![index].author", icon: Icons.person),
              ],
            ),
            Row(
              children: [
                BasicListtile(
                    title: "Aldığı Tarih",
                    subtitle: "widget.student.receivedBooks![index].receiptDate",
                    icon: Icons.book),
                BasicListtile(
                    title: "Teslim Tarihi",
                    subtitle: "widget.student.receivedBooks![index].returnDate",
                    icon: Icons.person),
              ],
            ),
          ],
        );
      },
    );
  }
}
