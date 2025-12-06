import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class BgPageLightButton extends ConsumerWidget {
  const BgPageLightButton({
    super.key,
    required this.text,
    this.width,
    required this.onPressed,
    this.btnPressProvider,
  });

  final String text;
  final double? width;
  final void Function() onPressed;
  final AutoDisposeStateProvider<bool>? btnPressProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool buttonPress = false;

    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageLight;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleLight;

    TextStyle textStyle = AppTextStyles.semiBold16.copyWith(color: textColor);

    if (btnPressProvider != null) {
      buttonPress = ref.watch(btnPressProvider!);
    }

    return SizedBox(
      width: width ?? double.maxFinite,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: buttonPress ? null : onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
