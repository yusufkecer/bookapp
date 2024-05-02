import 'package:bookapp/product/models/student.dart';

import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Student? student;
  const DetailCard({super.key, this.student});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        listTile("Adı Soyadı", "Sıla Bulut", Icons.person),
        listTile("Sınıfı", "5-D", Icons.school),
      ]),
      Row(children: [
        listTile("Numarası", "511", Icons.confirmation_number),
        listTile("Okuduğu Kitap", "Son Gece", Icons.book),
      ]),
      Row(
        children: [
          listTile("Alma Tarihi", "01.01.2010", Icons.calendar_today),
          listTile("Teslim Tarihi", "01.01.2010", Icons.today),
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
