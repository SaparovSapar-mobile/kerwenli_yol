import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyStatus extends ConsumerWidget {
  const CompanyStatus({super.key, required this.isOpen, this.fontSize});

  final bool isOpen;
  final double? fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color closedColor = isLight ? LightColors.error : DarkColors.error;
    final Color openColor = isLight ? LightColors.success : DarkColors.success;

    Color textColor = closedColor;
    String text = 'Yapyk';
    if (isOpen) {
      textColor = openColor;
      text = 'Acyk';
    }

    final TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: fontSize ?? 6,
      color: textColor,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 1, backgroundColor: textColor),
          SizedBox(width: 2),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
