import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ShareButton extends ConsumerWidget {
  const ShareButton({super.key, this.iconSize});

  final double? iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.share, size: iconSize ?? 24, color: iconColor),
    );
  }
}
