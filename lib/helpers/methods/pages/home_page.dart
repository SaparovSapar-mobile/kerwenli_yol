import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(16),
      child: Consumer(
        builder: (context, ref, widget) {
          bool isLight = isLightTheme(context, ref);
          Color bgColor = isLight
              ? LightColors.bgBlogLight
              : DarkColors.bgBlogDark;

          TextStyle dateStyle = AppTextStyles.medium12;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/appbar_logo.png', height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('09.11.2025 | ', style: dateStyle),
                        Text('13° Ашхабад', style: dateStyle),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AppBarBottomLine(thickness: 2),
              ],
            ),
          );
        },
      ),
    ),
  );
}
