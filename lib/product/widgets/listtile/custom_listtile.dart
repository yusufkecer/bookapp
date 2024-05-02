import 'package:bookapp/core/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:bookapp/product/project_radius.dart';

class PressableListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function() onPressed;
  const PressableListtile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: CustomRadius.ten(),
        ),
        child: Card(
          child: ListTile(
            title: Text(
              title,
              style: MyTheme.titleMid,
            ),
            subtitle: Text(
              subtitle,
            ),
            leading: Icon(leadingIcon, size: 40),
            trailing: Icon(trailingIcon),
          ),
        ),
      ),
    );
  }
}
