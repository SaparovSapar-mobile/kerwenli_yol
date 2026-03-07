import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/convert_and_sort.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ShowDate extends ConsumerWidget {
  const ShowDate({super.key, this.date, this.fontSize});

  final String? date;
  final double? fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    // ========= Text Styles =========
    final TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: fontSize ?? 8,
      fontStyle: FontStyle.italic,
    );

    final bool hasDate = date != null;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 8),
          SizedBox(width: 5),
          Text(hasDate ? formatDate(date!) : '6.06.2025', style: textStyle),
        ],
      ),
    );
  }
}
