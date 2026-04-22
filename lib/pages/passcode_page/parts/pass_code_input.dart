import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/providers/parts/inputs.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'package:pinput/pinput.dart';

class PassCodeInput extends ConsumerStatefulWidget {
  const PassCodeInput({super.key});

  @override
  ConsumerState<PassCodeInput> createState() => _PassCodeInputState();
}

class _PassCodeInputState extends ConsumerState<PassCodeInput> {
  final TextEditingController _ctrl = TextEditingController();

  final FocusNode _pinFocus = FocusNode();

  @override
  void dispose() {
    _ctrl.dispose();
    _pinFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color focusedBorderColor = isLight
        ? LightColors.primary
        : DarkColors.primary;

    // ========= Text Styles ==========
    final TextStyle textStyle = AppTextStyles.medium16.copyWith(
      fontWeight: FontWeight.bold,
      color: textColor,
    );

    final int passCodeCounter = ref.watch(passCodeCounterProvider);
    final bool firstCount = passCodeCounter == 0;

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
          focusNode: _pinFocus,
          controller: _ctrl,
          length: 4,
          defaultPinTheme: pinTheme,
          focusedPinTheme: pinTheme.copyWith(
            decoration: pinTheme.decoration!.copyWith(
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          onCompleted: (value) {
            if (value.length != 4) return;

            if (firstCount) {
              Future.microtask(() {
                _pinFocus.requestFocus();
              });

              ref.read(firstPassCodeProvider.notifier).state = _ctrl.text;
              _ctrl.clear();
              ref.read(passCodeCounterProvider.notifier).state = 1;
              return;
            }

            String firstPassCode = ref.read(firstPassCodeProvider);

            if (_ctrl.text != firstPassCode) {
              showErrorSnackbar(
                context,
                lang.pleaseEnterTheInformationCompletelyAndCorrectly,
              );
              ref.read(firstPassCodeProvider.notifier).state = '';
              ref.read(passCodeCounterProvider.notifier).state = 0;
              _ctrl.clear();
            }
          },
        ),
        SizedBox(height: 20),
        PrimaryButton(
          text: lang.confirm,
          onPressed: () {
            ref.read(passCodeProvider.notifier).update(int.parse(_ctrl.text));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
