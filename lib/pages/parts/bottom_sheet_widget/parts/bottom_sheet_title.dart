import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_features/parts/company_feature_part.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class BottomSheetTitle extends ConsumerWidget {
  const BottomSheetTitle({
    super.key,
    required this.text,
    this.style,
    this.icon,
  });

  final String text;
  final TextStyle? style;
  final String? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color iconBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ======= Text Styles =========
    TextStyle textStyle = style ?? AppTextStyles.semiBold14;
    TextStyle titleStyle = textStyle.copyWith(color: iconColor);

    bool hasIcon = icon != null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  hasIcon
                      ? CompanyFeaturePart(text: '', image: icon!)
                      : const SizedBox.shrink(),
                  Text(text, style: titleStyle),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(Icons.close, color: iconColor, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
