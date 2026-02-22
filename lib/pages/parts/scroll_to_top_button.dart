import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ScrollToTopButton extends ConsumerWidget {
  const ScrollToTopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.primary : DarkColors.primary;
    Color iconColor = Colors.white;

    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: bgColor,
      child: Icon(Icons.arrow_upward, size: 24, color: iconColor),
    );
  }
}
