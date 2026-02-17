import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ClearInputButton extends ConsumerWidget {
  const ClearInputButton({
    super.key,
    this.showClearInputProvider,
    required this.showClearInput,
    required this.ctrl,
  });

  final AutoDisposeStateProvider<bool>? showClearInputProvider;
  final bool showClearInput;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    return GestureDetector(
      onTap: () {
        ref.read(showClearInputProvider!.notifier).state = !showClearInput;
        ctrl.clear();
      },
      child: Icon(Icons.cancel, color: iconColor),
    );
  }
}
