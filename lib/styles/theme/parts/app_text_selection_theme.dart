import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class AppTextSelectionTheme {
  AppTextSelectionTheme._();

  static TextSelectionThemeData lightTextSelectionTheme =
      const TextSelectionThemeData(
        cursorColor: LightColors.textTitleLight,
        selectionColor: LightColors.textTitleLight,
      );

  static TextSelectionThemeData darkTextSelectionTheme =
      const TextSelectionThemeData(
        cursorColor: DarkColors.textTitleDark,
        selectionColor: DarkColors.textTitleDark,
      );
}
