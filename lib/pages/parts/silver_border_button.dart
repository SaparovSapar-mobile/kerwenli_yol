import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SilverBorderButton extends ConsumerWidget {
  const SilverBorderButton({
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

    // ========== Colors ==============
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    // ========== Text Styles ==============
    final TextStyle textStyle = AppTextStyles.semiBold16;

    if (btnPressProvider != null) {
      buttonPress = ref.watch(btnPressProvider!);
    }

    final bool hasIcon = icon != null;
    if (hasIcon) {
      textColor = isLight ? LightColors.error : DarkColors.error;
    }

    return SizedBox(
      width: width ?? double.maxFinite,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: buttonPress ? null : onPressed,
        child: buttonPress
            ? loadWidget
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasIcon) Icon(icon, size: 20, color: textColor),
                  if (hasIcon) SizedBox(width: 10),
                  Text(text, style: textStyle.copyWith(color: textColor)),
                ],
              ),
      ),
    );
  }
}
