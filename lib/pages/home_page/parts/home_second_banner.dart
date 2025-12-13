import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/home_banner.dart';

class HomeSecondBanner extends StatelessWidget {
  const HomeSecondBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: HomeBanner(
            height: 122,
            width: double.infinity,
            borderRadius: 8,
            dotsLeft: 4,
            dotsBottom: 4,
            dotsSize: 4.0,
            dotsActiveWidth: 9.0,
            dotsActiveHeight: 4.0,
          ),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
