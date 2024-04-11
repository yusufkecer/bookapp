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
    NavModel(id: 0, icons: Icons.home, name: 'Home'),
    NavModel(id: 1, icons: Icons.search, name: 'Search'),
    NavModel(id: 2, icons: Icons.favorite, name: 'Like'),
    NavModel(id: 3, icons: Icons.notifications, name: 'notification'),
    NavModel(id: 4, icons: Icons.person_3_rounded, name: 'Profile'),
  ];

  static List<NavModel> get navBtn => _navBtn;
}
