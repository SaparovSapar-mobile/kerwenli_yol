import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class UserProfileInfoCard extends ConsumerWidget {
  const UserProfileInfoCard({
    super.key,
    required this.icon,
    required this.text,
    required this.countText,
  });

  final IconData icon;
  final String text, countText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors ==========
    final bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color iconColor = isLight ? LightColors.primary : DarkColors.primary;
    Color arrowIconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ========== Text styles ==========
    TextStyle textStyle = AppTextStyles.medium10;

    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: arrowIconColor),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(text, style: textStyle),
            ),
          ),
          Text(
            countText,
            style: textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
