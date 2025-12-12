import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeVipCompanyCard extends ConsumerWidget {
  const HomeVipCompanyCard({super.key, this.isFirst, this.isLast});

  final bool? isFirst, isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    TextStyle textStyle = AppTextStyles.medium10;

    return Container(
      width: 90,
      margin: isFirst != null && isLast != null
          ? EdgeInsets.only(left: isFirst! ? 16 : 0, right: isLast! ? 16 : 0)
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),

            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              height: 29,
              width: 38,
              child: ShowImage(image: 'assets/examples/leader_company.png'),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Täze aý',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
