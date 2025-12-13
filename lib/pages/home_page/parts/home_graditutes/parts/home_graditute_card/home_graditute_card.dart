import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_graditutes/parts/home_graditute_card/parts/home_graditute_card_image.dart';
import 'package:kerwenli_yol/pages/parts/view_count.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeGradituteCard extends ConsumerWidget {
  const HomeGradituteCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color borderColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    TextStyle nameStyle = AppTextStyles.semiBold10;
    TextStyle descStyle = AppTextStyles.regular10.copyWith(color: textColor);

    return Container(
      width: 190,
      margin: isFirst != null && isLast != null
          ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
          : null,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              HomeGradituteCardImage(),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Innowasiya merkezi',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: nameStyle,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 5),
            child: Text(
              'Türkmenistanyň Ministrler Kabinetiniň ýanyndaky Ulag we komminikasiya',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: descStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ViewCount(), ViewCount()],
          ),
        ],
      ),
    );
  }
}
