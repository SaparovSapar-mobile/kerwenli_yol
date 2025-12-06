import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/onboard.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class OnboardNextButton extends ConsumerWidget {
  const OnboardNextButton({super.key, required this.pageCtrl});

  final PageController pageCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.primary : DarkColors.primary;
    Color iconColor = isLight
        ? LightColors.textTitleDark
        : DarkColors.textTitleDark;

    return GestureDetector(
      onTap: () {
        int page = ref.read(onboardPageIndexProvider);
        ref.read(onboardPageIndexProvider.notifier).state = page + 1;

        pageCtrl.animateToPage(
          page + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );

        // ref.read(isFirstTimeProvider.notifier).update(false);
        // Navigator.pushReplacement(
        //   context,
        //   CustomPageRoute(
        //     child: const BottomNavigationPage(),
        //     direction: AxisDirection.left,
        //   ),
        // );
      },
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(Icons.arrow_forward, size: 24, color: iconColor),
      ),
    );
  }
}
