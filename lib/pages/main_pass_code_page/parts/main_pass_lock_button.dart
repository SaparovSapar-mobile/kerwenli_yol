import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class MainPassLockButton extends ConsumerWidget {
  const MainPassLockButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors ========
    bool isLight = isLightTheme(context, ref);
    Color btnBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color btnColor = isLight ? LightColors.primary : DarkColors.primary;

    // ======= Text Styles ========
    TextStyle titleStyle = AppTextStyles.medium16;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: btnBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(Icons.lock, size: 16, color: btnColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text('Pin kodynyzy girizin', style: titleStyle),
        ),
      ],
    );
  }
}
