import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class BottomSheetTitle extends ConsumerWidget {
  const BottomSheetTitle({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color iconBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    TextStyle textStyle = style ?? AppTextStyles.semiBold14;
    TextStyle titleStyle = textStyle.copyWith(color: iconColor);

    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(text, style: titleStyle)),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.close, color: iconColor, size: 24),
          ),
        ],
      ),
    );
  }
}
