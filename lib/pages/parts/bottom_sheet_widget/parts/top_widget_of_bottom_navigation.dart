import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class TopWidgetOfBottomNavigation extends ConsumerWidget {
  const TopWidgetOfBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    return Container(
      height: 6,
      width: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: iconColor,
      ),
    );
  }
}
