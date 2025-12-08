import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    hintStyle: AppTextStyles.medium16.copyWith(
      color: LightColors.textTitleLight,
    ),
    errorStyle: AppTextStyles.medium16.copyWith(
      color: LightColors.textTitleLight,
    ),
    labelStyle: AppTextStyles.medium14.copyWith(
      color: LightColors.textTitleLight,
    ),
    enabledBorder: outlineInputLightBorder,
    focusedBorder: outlineInputLightBorder,
    errorBorder: lightErrorBorder,
    focusedErrorBorder: lightErrorBorder,
    contentPadding: const EdgeInsets.all(14),
    filled: true,
    fillColor: LightColors.bgPageLight,
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    hintStyle: AppTextStyles.medium16.copyWith(color: DarkColors.textTitleDark),
    errorStyle: AppTextStyles.medium16.copyWith(
      color: DarkColors.textTitleLight,
    ),
    labelStyle: AppTextStyles.medium14.copyWith(
      color: DarkColors.textDescriptionDark,
    ),
    enabledBorder: outlineInputDarkBorder,
    focusedBorder: outlineInputDarkBorder,
    errorBorder: darkErrorBorder,
    focusedErrorBorder: darkErrorBorder,
    contentPadding: const EdgeInsets.all(14),
    filled: true,
    fillColor: DarkColors.bgPageDark,
  );
}

InputBorder outlineInputLightBorder = OutlineInputBorder(
  borderSide: BorderSide(color: LightColors.textDescriptionLight),
  borderRadius: BorderRadius.circular(8),
);

OutlineInputBorder lightErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: LightColors.primary),
  borderRadius: const BorderRadius.all(Radius.circular(8)),
);

InputBorder outlineInputDarkBorder = OutlineInputBorder(
  borderSide: BorderSide(color: DarkColors.textDescriptionDark),
  borderRadius: BorderRadius.circular(8),
);

OutlineInputBorder darkErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: DarkColors.primary),
  borderRadius: const BorderRadius.all(Radius.circular(8)),
);
