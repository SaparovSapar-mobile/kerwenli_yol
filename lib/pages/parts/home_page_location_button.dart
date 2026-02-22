import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class HomePageLocationButton extends ConsumerWidget {
  const HomePageLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color borderColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    return Positioned(
      bottom: 20,
      right: 20,
      child: SizedBox(
        width: 44,
        height: 44,
        child: FloatingActionButton(
          backgroundColor: bgColor,
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: borderColor, width: 5),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
