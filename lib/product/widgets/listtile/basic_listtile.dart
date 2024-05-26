import 'package:flutter/material.dart';

class BasicListtile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;

  const BasicListtile({super.key, required this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return listTile(title, subtitle, icon);
  }

  Expanded listTile(String title, String? subtitle, IconData? icon) {
    return Expanded(
      child: Card(
        child: ListTile(
          leading: icon != null ? Icon(icon) : const SizedBox.shrink(),
          title: Text(title),
          subtitle: Text(subtitle ?? ""),
        ),
      ),
    );
  }
}
