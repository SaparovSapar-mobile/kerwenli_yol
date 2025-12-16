import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

BottomNavigationBarItem bottomNavBarItem(
  IconData icon,
  String text,
  bool isSelected,
  bool isLight,
) {
  Color activeColor = isLight ? LightColors.primary : DarkColors.primary;
  Color disableColor = isLight
      ? LightColors.textTitleLight
      : DarkColors.textTitleDark;

  return BottomNavigationBarItem(
    label: isSelected ? text : '',
    icon: Icon(icon, size: 24, color: isSelected ? activeColor : disableColor),
  );
}
