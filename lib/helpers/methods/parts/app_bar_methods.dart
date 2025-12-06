import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

PreferredSize appBarBottomLine() {
  return PreferredSize(
    preferredSize: Size.fromHeight(4),
    child: Consumer(
      builder: (context, ref, widget) {
        bool isLight = isLightTheme(context, ref);
        Color lineColor = isLight
            ? LightColors.bgPageLight
            : DarkColors.bgPageDark;

        return Divider(height: 4, color: lineColor);
      },
    ),
  );
}
