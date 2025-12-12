import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/parts/home_banner.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    double bottomBannersWidth = (screenProperties(context).width - 42) / 2;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeBanner(
            height: 122,
            width: double.infinity,
            borderRadius: 8,
            dotsLeft: 4,
            dotsBottom: 4,
            dotsSize: 4.0,
            dotsActiveWidth: 9.0,
            dotsActiveHeight: 4.0,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              HomeBanner(
                height: 64,
                width: bottomBannersWidth,
                borderRadius: 6,
                dotsLeft: 3,
                dotsBottom: 3,
                dotsSize: 2.0,
                dotsActiveWidth: 4.0,
                dotsActiveHeight: 2.0,
              ),
              SizedBox(width: 10),
              HomeBanner(
                height: 64,
                width: bottomBannersWidth,
                borderRadius: 6,
                dotsLeft: 3,
                dotsBottom: 3,
                dotsSize: 2.0,
                dotsActiveWidth: 4.0,
                dotsActiveHeight: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
