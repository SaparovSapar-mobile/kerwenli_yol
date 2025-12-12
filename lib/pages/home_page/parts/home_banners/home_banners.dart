import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_banners/home_banner.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    double bottomBannersWidth = (screenProperties(context).width - 42) / 2;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeBanner(height: 122, width: double.infinity, borderRadius: 8),
          SizedBox(height: 10),
          Row(
            children: [
              HomeBanner(
                height: 64,
                width: bottomBannersWidth,
                borderRadius: 6,
              ),
              SizedBox(width: 10),
              HomeBanner(
                height: 64,
                width: bottomBannersWidth,
                borderRadius: 6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
