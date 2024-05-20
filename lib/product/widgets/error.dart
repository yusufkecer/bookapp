import 'package:bookapp/product/string_data/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      ProjectAssets.error,
      fit: BoxFit.contain,
      height: 300,
      width: 300,
    ));
  }
}
