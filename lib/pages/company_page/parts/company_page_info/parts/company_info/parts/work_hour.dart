import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class WorkHour extends ConsumerWidget {
  const WorkHour({super.key, required this.keyText, required this.valueText});

  final String keyText, valueText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color valueColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle keyStyle = AppTextStyles.semiBold10.copyWith(
      color: valueColor,
    );
    final TextStyle valueStyle = AppTextStyles.semiBold10.copyWith(
      color: valueColor,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(keyText, style: keyStyle),
              Text(valueText, style: valueStyle),
            ],
          ),
          SizedBox(height: 2),
          AppBarBottomLine(thickness: 2),
        ],
      ),
    );
  }
}
