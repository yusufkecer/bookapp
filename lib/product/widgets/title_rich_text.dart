import 'package:flutter/material.dart';

class TitleWithRichText extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleWithRichText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: "$title: ",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ],
    ));
  }
}
