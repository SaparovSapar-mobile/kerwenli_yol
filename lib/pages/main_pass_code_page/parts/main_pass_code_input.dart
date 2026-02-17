import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:pinput/pinput.dart';

class MainPassCodeInput extends ConsumerStatefulWidget {
  const MainPassCodeInput({super.key});

  @override
  ConsumerState<MainPassCodeInput> createState() => _MainPassCodeInputState();
}

class _MainPassCodeInputState extends ConsumerState<MainPassCodeInput> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    Color focusedBorderColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    // ========= Text Styles ==========
    TextStyle textStyle = AppTextStyles.medium16.copyWith(
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    final pinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: textStyle,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pinput(
          controller: _ctrl,
          length: 4,
          defaultPinTheme: pinTheme,
          focusedPinTheme: pinTheme.copyWith(
            decoration: pinTheme.decoration!.copyWith(
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          onCompleted: (value) {},
        ),
        SizedBox(height: 20),
        PrimaryButton(
          text: 'Tassykla',
          onPressed: () {
            int passCode = ref.read(passCodeProvider);

            if (passCode.toString() != _ctrl.text) {
              showErrorSnackbar(context, 'Pin Kodynyzy dogry girizin');
              _ctrl.clear();
              return;
            }

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNavigationPage(),
              ),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }
}
