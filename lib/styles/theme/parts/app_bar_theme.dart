import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: LightColors.primary,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: AppTextStyles.semiBold20.copyWith(
      color: LightColors.textTitleLight,
    ),
    centerTitle: true,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: DarkColors.primary,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: AppTextStyles.semiBold20.copyWith(
      color: DarkColors.textTitleDark,
    ),
    centerTitle: true,
  );
}
