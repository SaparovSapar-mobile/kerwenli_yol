import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class ResendOtpButton extends ConsumerStatefulWidget {
  final VoidCallback onResend;

  const ResendOtpButton({super.key, required this.onResend});

  @override
  ConsumerState<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends ConsumerState<ResendOtpButton> {
  int _seconds = 60; // toplam süre
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer(); // sayfa açılınca başlasın
  }

  void startTimer() {
    _seconds = 59; // her başlatmada resetle

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() => _seconds--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // hafıza sızıntısını engelle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = isLightTheme(context, ref);
    final Color timerColor = isLight ? LightColors.primary : DarkColors.primary;
    final Color textColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color activeTextColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    final TextStyle textStyle = AppTextStyles.semiBold14;

    return TextButton(
      onPressed: _seconds > 0
          ? null
          : () {
              widget.onResend(); // dışarıdan çağırılan fonksiyon
              startTimer(); // tekrar sayaç başlasın
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('00:$_seconds', style: textStyle.copyWith(color: timerColor)),
          SizedBox(width: 12),
          Text(
            'Kody täzeden ugratmak',
            style: textStyle.copyWith(
              color: _seconds > 0 ? textColor : activeTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
