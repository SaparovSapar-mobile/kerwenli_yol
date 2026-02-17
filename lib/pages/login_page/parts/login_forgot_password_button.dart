import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/forgot_password_page/forgot_password_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class LoginForgotPasswordButton extends ConsumerWidget {
  const LoginForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    TextStyle textStyle = AppTextStyles.medium14.copyWith(
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: textColor,
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.only(left: 0)),
        onPressed: () =>
            goToPage(context, ForgotPasswordPage(), AxisDirection.left),
        child: Text('Parolymy unutdym', style: textStyle),
      ),
    );
  }
}
