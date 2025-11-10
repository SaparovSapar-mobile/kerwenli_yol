import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavBarItem(
  IconData icon,
  String text,
  bool isSelected,
) {
  return BottomNavigationBarItem(label: text, icon: Icon(icon));
}
