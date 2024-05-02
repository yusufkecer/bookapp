import 'package:flutter/material.dart';

class CustomRadius extends BorderRadius {
  const CustomRadius.ten()
      : super.all(
          const Radius.circular(10.0),
        );
}
