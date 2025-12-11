import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeTopCategoriesButton extends ConsumerWidget {
  const HomeTopCategoriesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color iconColor = isLight ? LightColors.primary : DarkColors.primary;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    TextStyle textStyle = AppTextStyles.medium14.copyWith(color: textColor);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(Icons.menu_open, color: iconColor, size: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Ählisi', style: textStyle),
          ),
          CircleAvatar(radius: 3, backgroundColor: iconColor),
        ],
      ),
    );
  }
}
