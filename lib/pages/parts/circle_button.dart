import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CircleButton extends ConsumerWidget {
  const CircleButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors ======
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    return GestureDetector(
      //
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: bgColor,
        radius: 22,
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}
