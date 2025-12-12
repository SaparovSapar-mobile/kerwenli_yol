import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeCategoryCard extends ConsumerWidget {
  const HomeCategoryCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color inBgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    TextStyle textStyle = AppTextStyles.medium12;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
      margin: isFirst != null && isLast != null
          ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
          : null,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            height: 31,
            width: 31,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: inBgColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ShowImage(image: 'assets/examples/category_icon.png'),
          ),
          SizedBox(width: 5),
          Text(
            'Лихорадка и инфекция',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
