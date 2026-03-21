import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class AboutUsPart extends ConsumerWidget {
  const AboutUsPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    // ========== Text Styles =========
    final TextStyle textStyle = AppTextStyles.semiBold10;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.info, size: 16, color: iconColor),
          ),
          SizedBox(width: 10),
          Text('Karhana barada', style: textStyle),
        ],
      ),
    );
  }
}
