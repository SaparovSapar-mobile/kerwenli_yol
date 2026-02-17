import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class InternetStatusBarContainer extends ConsumerWidget {
  const InternetStatusBarContainer({
    super.key,
    required this.isOnline,
    required this.icon,
    required this.text,
  });

  final bool isOnline;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isOnline
        ? isLight
              ? LightColors.newCard
              : DarkColors.newCard
        : isLight
        ? LightColors.error
        : DarkColors.error;
    Color iconColor = Color(0xffFFFFFF);

    // ========= Text Styles ==========
    TextStyle textStyle = AppTextStyles.medium10.copyWith(color: iconColor);

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 7.5),
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: bgColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          SizedBox(width: 2),
          Text(text, textAlign: TextAlign.center, style: textStyle),
        ],
      ),
    );
  }
}
