import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class DotssIndicator extends ConsumerWidget {
  const DotssIndicator({
    super.key,
    required this.lenght,
    required this.pageProvider,
  });

  final int lenght;
  final AutoDisposeStateProvider<int> pageProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int page = ref.watch(pageProvider);
    bool isLight = isLightTheme(context, ref);
    Color activeColor = isLight ? LightColors.primary : DarkColors.primary;
    Color disableColor = isLight
        ? LightColors.loadingBackground
        : DarkColors.loadingBackground;

    return DotsIndicator(
      dotsCount: lenght,
      position: page.toDouble(),
      decorator: DotsDecorator(
        spacing: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
        color: disableColor,
        activeColor: activeColor,
        size: const Size(14.0, 6.0),
        activeSize: const Size(30.0, 6.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
