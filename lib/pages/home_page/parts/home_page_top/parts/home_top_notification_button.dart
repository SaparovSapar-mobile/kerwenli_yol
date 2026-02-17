import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class HomeTopNotificationButton extends ConsumerWidget {
  const HomeTopNotificationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8.5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.notifications, color: iconColor, size: 18),
      ),
    );
  }
}
