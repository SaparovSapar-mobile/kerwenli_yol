import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanySubscribeButton extends ConsumerWidget {
  const CompanySubscribeButton({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    final TextStyle textStyle = AppTextStyles.bold12;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      height: 26,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.add_circle, size: 16, color: iconColor),
          SizedBox(width: 4),
          Text('Agza bol', style: textStyle),
        ],
      ),
    );
  }
}
