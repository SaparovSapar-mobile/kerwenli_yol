import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/bg_page_light_button.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/pages/register_page/register_page.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class OnboardLoginOrRegisterPart extends ConsumerWidget {
  const OnboardLoginOrRegisterPart({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image, title, desc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color titleColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color descColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    final TextStyle titleStyle = AppTextStyles.semiBold20.copyWith(
      color: titleColor,
    );
    final TextStyle descStyle = AppTextStyles.regular16.copyWith(
      color: descColor,
    );

    return Column(
      children: [
        Image.asset('assets/images/$image', height: 227.43),
        Expanded(child: SizedBox.shrink()),
        Text(title, style: titleStyle),
        SizedBox(height: 10),
        Text(desc, style: descStyle, textAlign: TextAlign.center),
        SizedBox(height: 47),
        PrimaryButton(
          text: 'Agza bolmak',
          onPressed: () =>
              goToPage(context, RegisterPage(), AxisDirection.left),
        ),
        SizedBox(height: 10),
        BgPageLightButton(
          text: 'Gezelenç',
          onPressed: () {
            ref.read(isFirstTimeProvider.notifier).update(false);
            Navigator.pushReplacement(
              context,
              CustomPageRoute(
                child: const BottomNavigationPage(),
                direction: AxisDirection.left,
              ),
            );
          },
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
