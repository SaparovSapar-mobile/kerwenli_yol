import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyFeaturePart extends ConsumerWidget {
  const CompanyFeaturePart({
    super.key,
    required this.text,
    required this.image,
    this.isNetworkImage = false,
  });

  final String text, image;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    TextStyle textStyle = AppTextStyles.regular10;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: isNetworkImage
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: ShowNetwImage(image: image),
                  )
                : Image.asset(
                    'assets/images/$image',
                    width: 16,
                    height: 16,
                    color: iconColor,
                  ),
          ),
          SizedBox(width: 10),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
