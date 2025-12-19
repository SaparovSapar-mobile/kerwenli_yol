import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/check_otp_page/parts/otp_input.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/theme_switcher_button.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CheckOtpPage extends ConsumerWidget {
  const CheckOtpPage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    TextStyle textStyle = AppTextStyles.semiBold16;

    return Scaffold(
      appBar: AppBar(
        leading: BackLeadingButton(),
        title: Text('SMS'),
        backgroundColor: bgColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 16),
            child: ThemeSwitcherButton(),
          ),
        ],
        bottom: appBarBottomLine(),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 16, top: 24, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: textStyle),
            SizedBox(height: 24),
            OtpInput(),
            SizedBox(height: 16),
            PrimaryButton(
              text: 'Tassykalamk',
              onPressed: () =>
                  goToPage(context, BottomNavigationPage(), AxisDirection.left),
            ),
          ],
        ),
      ),
    );
  }
}
