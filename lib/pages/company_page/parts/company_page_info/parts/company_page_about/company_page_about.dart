import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/home_banner.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyPageAbout extends ConsumerWidget {
  const CompanyPageAbout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    TextStyle textStyle = AppTextStyles.semiBold12;
    TextStyle descStyle = AppTextStyles.regular12;

    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Container(
        padding: EdgeInsetsGeometry.all(8),
        decoration: BoxDecoration(
          color: innerBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Biz barada', style: textStyle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: HomeBanner(
                height: 120,
                width: double.infinity,
                borderRadius: 8,
                dotsLeft: 4,
                dotsBottom: 4,
                dotsSize: 4.0,
                dotsActiveWidth: 9.0,
                dotsActiveHeight: 4.0,
              ),
            ),
            Text(
              '''Contrary to popular belief, Lorem Ipsum is not simply random text.
It has roots in a piece of classical Latin literature from 45 BC, 
making it over 2000 years old. Richard McClintock,
a Latin professor at HampdenContrary to popular belief,
Lorem Ipsum is not simply random text.
It has roots in a piece of classical Latin literature from 45 BC,
making it over 2000 years old. Richard McClintock, a Latin professor at Hampden...''',
              style: descStyle,
            ),
          ],
        ),
      ),
    );
  }
}
