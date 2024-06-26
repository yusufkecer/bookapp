import 'package:flutter/material.dart';

class NavModel {
  final int? id;
  final IconData? icons;
  final String? name;

  const NavModel({
    this.id,
    this.icons,
    this.name,
  });

  static const List<NavModel> _navBtn = [
    NavModel(id: 0, icons: Icons.menu_book_rounded, name: 'Kitaplar'),
    NavModel(id: 1, icons: Icons.person, name: 'Öğrenciler'),
  ];

  static List<NavModel> get navBtn => _navBtn;
  static const navBarHeight = 80.0;
}
