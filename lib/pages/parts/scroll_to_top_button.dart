import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ScrollToTopButton extends ConsumerWidget {
  const ScrollToTopButton({super.key, required this.provider});

  final AutoDisposeStateProvider<ScrollController> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight ? LightColors.primary : DarkColors.primary;
    final Color iconColor = Colors.white;

    final ScrollController scrollCtrl = ref.watch(provider);

    return Positioned(
      bottom: 20,
      left: 20,
      child: SizedBox(
        height: 44,
        width: 44,
        child: FloatingActionButton(
          backgroundColor: bgColor,
          child: Icon(Icons.arrow_upward, size: 24, color: iconColor),
          onPressed: () async {
            scrollCtrl.animateTo(
              scrollCtrl.position.minScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
            );
          },
        ),
      ),
    );
  }
}
