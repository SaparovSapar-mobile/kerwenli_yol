import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ShowDate extends ConsumerWidget {
  const ShowDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    // ========= Text Styles =========
    TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: 8,
      fontStyle: FontStyle.italic,
    );

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
          Text('6.06.2025', style: textStyle),
        ],
      ),
    );
  }
}
