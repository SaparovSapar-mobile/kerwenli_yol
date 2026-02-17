import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyInfoKeyValue extends ConsumerWidget {
  const CompanyInfoKeyValue({
    super.key,
    required this.keyText,
    required this.valueText,
  });

  final String keyText, valueText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color keyColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    Color valueColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    TextStyle keyStyle = AppTextStyles.regular12.copyWith(color: keyColor);
    TextStyle valueStyle = AppTextStyles.regular12.copyWith(color: valueColor);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: Text(keyText, style: keyStyle)),
          SizedBox(width: 16),
          Expanded(child: Text(valueText, style: valueStyle)),
        ],
      ),
    );
  }
}
