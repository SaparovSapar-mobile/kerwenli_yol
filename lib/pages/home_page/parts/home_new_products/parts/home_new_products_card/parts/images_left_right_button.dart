import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ImagesLeftRightButton extends ConsumerWidget {
  const ImagesLeftRightButton({
    super.key,
    required this.isLeftBtn,
    required this.onTap,
  });

  final bool isLeftBtn;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05), // gölge rengi
              blurRadius: 6, // yumuşaklık
              offset: const Offset(0, 3), // x,y yönü
            ),
          ],
        ),
        child: Center(
          child: Icon(
            isLeftBtn ? Icons.arrow_back_ios_new : Icons.arrow_forward_ios,
            size: 23,
          ),
        ),
      ),
    );
  }
}
