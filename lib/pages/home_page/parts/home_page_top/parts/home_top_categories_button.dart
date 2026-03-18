import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/categories_page/categories_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeTopCategoriesButton extends ConsumerWidget {
  const HomeTopCategoriesButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle textStyle = AppTextStyles.medium14.copyWith(
      color: textColor,
    );

    return GestureDetector(
      onTap: () => goToPage(context, CategoriesPage(), AxisDirection.right),
      child: Container(
        padding: EdgeInsets.all(8.5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.menu_open, color: iconColor, size: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Ählisi', style: textStyle),
            ),
            CircleAvatar(radius: 3, backgroundColor: iconColor),
          ],
        ),
      ),
    );
  }
}
