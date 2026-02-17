import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/parts/inputs/search_input.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

AppBar searchPageAppBar(BuildContext context) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(18),
      child: Consumer(
        builder: (context, ref, widget) {
          // ======= Colors =======
          final bool isLight = isLightTheme(context, ref);
          Color bgColor = isLight
              ? LightColors.bgBlogLight
              : DarkColors.bgBlogDark;

          return Container(
            padding: EdgeInsets.only(left: 16, top: 10, right: 16),
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
                SearchInput(),
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
