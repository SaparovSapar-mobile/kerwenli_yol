import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeVipCompanyCardCategories extends ConsumerWidget {
  const HomeVipCompanyCardCategories({super.key, this.iconSize});

  final double? iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: iconSize ?? 6,
    );

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(color: bgColor),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Category/sub category', style: textStyle),
            Icon(Icons.arrow_forward_ios, size: iconSize ?? 6),
          ],
        ),
      ),
    );
  }
}
