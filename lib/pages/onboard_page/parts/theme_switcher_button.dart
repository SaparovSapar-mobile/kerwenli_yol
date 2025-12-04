import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/theme.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/theme/theme.dart';

class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    return GestureDetector(
      onTap: () {
        var brightness = ThemeModelInheritedNotifier.of(
          context,
        ).theme.brightness;

        ThemeSwitcher.of(context).changeTheme(
          theme: brightness == Brightness.light
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          isReversed: brightness == Brightness.light ? true : false,
        );

        if (isLight) {
          ref.read(themeProvider.notifier).update(ThemeType.black);
        } else {
          ref.read(themeProvider.notifier).update(ThemeType.white);
        }
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          ThemeModelInheritedNotifier.of(context).theme.brightness ==
                  Brightness.light
              ? Icons.dark_mode
              : Icons.light_mode,
          color: LightColors.primary,
        ),
      ),
    );
  }
}
