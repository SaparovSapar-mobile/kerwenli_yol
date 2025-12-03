import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/styles/theme/theme.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ThemeSwitcher(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      var brightness = ThemeModelInheritedNotifier.of(
                        context,
                      ).theme.brightness;

                      ThemeSwitcher.of(context).changeTheme(
                        theme: brightness == Brightness.light
                            ? AppTheme.darkTheme
                            : AppTheme.lightTheme,
                        isReversed: brightness == Brightness.light
                            ? true
                            : false,
                      );
                    },
                    icon: Icon(
                      ThemeModelInheritedNotifier.of(
                                context,
                              ).theme.brightness ==
                              Brightness.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
