import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: LightColors.primary,
    elevation: 0,
    scrolledUnderElevation: 0,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: DarkColors.primary,
    elevation: 0,
    scrolledUnderElevation: 0,
  );
}
