import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SomeError extends StatelessWidget {
  const SomeError({super.key, required this.ref, required this.apiProviders});

  final WidgetRef ref;
  final List<dynamic> apiProviders;

  @override
  Widget build(BuildContext context) {
    // ======= Colors ======
    final bool isLight = isLightTheme(context, ref);
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color iconColor = isLight
        ? LightColors.textTitleDark
        : DarkColors.textTitleDark;
    final Color bgColor = isLight ? LightColors.primary : DarkColors.primary;

    final TextStyle textStyle = AppTextStyles.bold20.copyWith(color: textColor);
    final TextStyle iconTextStyle = AppTextStyles.semiBold16.copyWith(
      color: iconColor,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_result.png',
            height: 111.92688751220703,
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 20),
            child: Text('Nasazlyk Yuze cykdy', style: textStyle),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              for (var element in apiProviders) {
                ref.invalidate(element);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Tazeden Synans', style: iconTextStyle),
                SizedBox(width: 10),
                Icon(Icons.replay_outlined, color: iconColor, size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
