import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class OnboardPart extends ConsumerWidget {
  const OnboardPart({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image, title, desc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color titleColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color descColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    TextStyle titleStyle = AppTextStyles.semiBold20.copyWith(color: titleColor);
    TextStyle descStyle = AppTextStyles.regular16.copyWith(color: descColor);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset('assets/images/$image', height: 267.16),
        Expanded(child: SizedBox.shrink()),
        Text(title, style: titleStyle),
        SizedBox(height: 10),
        Text(desc, style: descStyle),
        SizedBox(height: 30),
      ],
    );
  }
}
