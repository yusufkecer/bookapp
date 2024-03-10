import 'package:flutter/material.dart';

class BookTextFormField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final Function(String? val) onSaved;
  final String? initialValue;

  BookTextFormField({
    required this.labelText,
    required this.errorText,
    required this.onSaved,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 16.0,
            color: Theme.of(context).textTheme.displayLarge?.color,
          ),
      decoration: InputDecoration(
          labelText: labelText,
          errorStyle: TextStyle(
            fontSize: 15.0,
            height: 0.9,
          ),
          labelStyle: TextStyle(color: Colors.grey)),
      validator: (value) {
        if (value == null) {
          return errorText;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
