import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
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
    this.icon,
  });

  final String text;
  final double? width;
  final void Function() onPressed;
  final AutoDisposeStateProvider<bool>? btnPressProvider;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool buttonPress = false;
    final bool hasIcon = icon != null;

    // ========== Colors ==============
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageLight;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleLight;

    // ========== Text Styles ==============
    final TextStyle textStyle = AppTextStyles.semiBold16.copyWith(
      color: textColor,
    );

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
        child: buttonPress
            ? loadWidget
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  hasIcon
                      ? Icon(icon, color: textColor, size: 20)
                      : const SizedBox.shrink(),
                  SizedBox(width: hasIcon ? 10 : 0),
                  Text(text, style: textStyle),
                ],
              ),
      ),
    );
  }
}
