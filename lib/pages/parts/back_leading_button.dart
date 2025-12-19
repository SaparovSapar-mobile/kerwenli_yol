import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class BackLeadingButton extends ConsumerWidget {
  const BackLeadingButton({super.key, this.text, this.onPressed});

  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    TextStyle textStyle = AppTextStyles.semiBold16;

    bool hasText = text != null;

    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      visualDensity: VisualDensity.compact,
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back_ios_new, color: iconColor, size: 20),
          SizedBox(width: hasText ? 10 : 0),
          if (hasText)
            Text(
              text!,
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
