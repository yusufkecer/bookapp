import 'package:bookapp/product/models/student.dart';

import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Student? student;
  const DetailCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    if (student == null) {
      //TODO: Show error message
      return const SizedBox();
    }
    return Column(children: [
      Row(children: [
        listTile("Adı Soyadı", "${student!.name!} ${student!.surname!}", Icons.person),
        listTile("Sınıfı", student!.stundentClass!, Icons.school),
      ]),
      Row(children: [
        listTile("Numarası", student!.studentNumber!, Icons.confirmation_number),
        listTile("Okuduğu Kitap", "Son Gece", Icons.book),
      ]),
      Row(
        children: [
          listTile("Alma Tarihi", "01.11.2015", Icons.calendar_today),
        ],
      ),
    ]);
  }

  Widget oldBookList() {
    if (student?.receivedBooks == null || student!.receivedBooks!.isEmpty) {
      return const SizedBox.shrink();
    }
    return ListView.builder(
      itemCount: student?.receivedBooks!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                listTile("Kitap Adı", "Ali Veli", Icons.person),
                listTile("Yazar", "5", Icons.school),
              ],
            ),
            Row(
              children: [
                listTile("Sayfa", "123456", Icons.confirmation_number),
                listTile("Açıklama", "Son Gece", Icons.book),
              ],
            ),
            Row(
              children: [
                listTile("Alma Tarihi", "01.11.2015", Icons.calendar_month),
                listTile("Teslim Tarihi", "01.11.2015", Icons.calendar_today),
              ],
            ),
          ],
        );
      },
    );
  }

  Expanded listTile(String title, String subtitle, IconData icon) {
    return Expanded(
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
