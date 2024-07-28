import 'package:bookapp/product/models/student.dart';

import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Student student;
  const DetailCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        listTile("Adı Soyadı", "${student.name!} ${student.surname!}", Icons.person),
        listTile("Sınıfı", student.stundentClass!, Icons.school),
      ]),
      Row(children: [
        listTile("Numarası", student.studentNumber!, Icons.confirmation_number),
        listTile("Okuduğu Kitap", "Son Gece", Icons.book),
      ]),
      Row(
        children: [
          listTile("Alma Tarihi", "01.11.2015", Icons.calendar_today),
        ],
      ),
    ]);
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
