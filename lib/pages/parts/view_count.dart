import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/convert_and_sort.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ViewCount extends ConsumerWidget {
  const ViewCount({
    super.key,
    this.bGColor,
    required this.viewCount,
    this.fontSize,
  });

  final Color? bGColor;
  final double? fontSize;
  final int viewCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    if (bGColor != null) {
      bgColor = bGColor!;
    }

    final TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: fontSize ?? 8,
    );

    final bool hasViewCount = viewCount != null;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatCount(hasViewCount ? viewCount! : 0).toString(),
            style: textStyle,
          ),
          SizedBox(width: 5),
          Icon(Icons.visibility, size: fontSize ?? 8),
        ],
      ),
    );
  }
}
