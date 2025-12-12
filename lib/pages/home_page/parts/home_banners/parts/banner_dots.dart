import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class BannerDots extends ConsumerWidget {
  const BannerDots({super.key, required this.lenght, required this.page});

  final int lenght, page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = Colors.white60;
    Color activeColor = isLight ? LightColors.primary : DarkColors.primary;
    Color inactiveColor = Color(0xffFFC4AE);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.84, vertical: 1.28),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DotsIndicator(
        dotsCount: lenght,
        position: page.toDouble(),
        decorator: DotsDecorator(
          spacing: const EdgeInsets.symmetric(vertical: 1, horizontal: 2.5),
          color: inactiveColor,
          activeColor: activeColor,
          size: const Size.square(4.0),
          activeSize: const Size(15.0, 6.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
