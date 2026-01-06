import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

BoxDecoration bottomNavigationBoxDecoration(bool isLight) => BoxDecoration(
  color: isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);
