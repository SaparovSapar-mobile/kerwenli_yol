import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HeaderCategories extends ConsumerWidget {
  const HeaderCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle textStyle = AppTextStyles.semiBold16;

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 16, right: 16, bottom: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lang.allCategory, style: textStyle),
            Container(
              padding: EdgeInsets.all(8.5),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.close, color: iconColor, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
