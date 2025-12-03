import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: "Inter",
  textTheme: TextTheme(
    // Display
    headlineLarge: AppTextStyles.bold24,
    headlineMedium: AppTextStyles.semiBold24,
    headlineSmall: AppTextStyles.medium24,

    titleLarge: AppTextStyles.bold20,
    titleMedium: AppTextStyles.semiBold20,
    titleSmall: AppTextStyles.medium20,

    // Text L
    bodyLarge: AppTextStyles.bold16,
    bodyMedium: AppTextStyles.semiBold16,
    bodySmall: AppTextStyles.regular16,

    // Text M
    labelLarge: AppTextStyles.bold14,
    labelMedium: AppTextStyles.semiBold14,
    labelSmall: AppTextStyles.regular14,
  ),
);

// final ThemeData appTheme = ThemeData(
//   fontFamily: "Inter",
//   textTheme: TextTheme(
//     // Display
//     headlineLarge: AppTextStyles.displayMBold,
//     headlineMedium: AppTextStyles.displayMSemiBold,
//     headlineSmall: AppTextStyles.displayMMedium,

//     titleLarge: AppTextStyles.displaySBold,
//     titleMedium: AppTextStyles.displaySSemiBold,
//     titleSmall: AppTextStyles.displaySMedium,

//     // Text L
//     bodyLarge: AppTextStyles.textLBold,
//     bodyMedium: AppTextStyles.textLSemiBold,
//     bodySmall: AppTextStyles.textLRegular,

//     // Text M
//     labelLarge: AppTextStyles.textMBold,
//     labelMedium: AppTextStyles.textMSemiBold,
//     labelSmall: AppTextStyles.textMRegular,

//     // Text S & XS istege göre eklenebilir
//   ),
// );
