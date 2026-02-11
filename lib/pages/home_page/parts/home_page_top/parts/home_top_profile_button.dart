import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class HomeTopProfileButton extends ConsumerWidget {
  const HomeTopProfileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    return GestureDetector(
      onTap: () => goToPage(context, LoginPage(), AxisDirection.left),
      child: Container(
        padding: EdgeInsets.all(8.5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.account_circle, color: iconColor, size: 18),
      ),
    );
  }
}
