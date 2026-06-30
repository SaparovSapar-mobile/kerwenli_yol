import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/functions/theme.dart';
import '../../helpers/methods/parts/app_bar_methods.dart';
import '../../l10n/app_localizations.dart';
import '../../styles/colors/dark_colors.dart';
import '../../styles/colors/light_colors.dart';
import '../../styles/text_styles.dart';
import '../new_password_input/new_password.dart';
import '../onboard_page/parts/theme_switcher_button.dart';
import '../parts/back_leading_button.dart';
import 'parts/check_otp_button.dart';
import 'parts/otp_input.dart';

class CheckOtpPage extends ConsumerStatefulWidget {
  const CheckOtpPage({
    super.key,
    required this.text,
    required this.email,
    required this.phone,
    required this.password,
    required this.forRegister,
    required this.fullName,
  });

  final String text, email, phone, fullName;
  final String password;
  final bool forRegister;

  @override
  ConsumerState<CheckOtpPage> createState() => _CheckOtpPageState();
}

class _CheckOtpPageState extends ConsumerState<CheckOtpPage> {
  late final TextEditingController _otpController;
  final TextEditingController newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Scaffold(
      appBar: AppBar(
        leading: BackLeadingButton(),
        title: Text(lang.sms),
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
            Text(widget.text, style: AppTextStyles.semiBold16),
            SizedBox(height: 24),
            OtpInput(
              otpController: _otpController, // ✅
              forRegister: widget.forRegister,
              email: widget.email,
              phone: widget.phone,
              fullName: widget.fullName,
              password: widget.password!,
            ),
            SizedBox(height: 16),
            CheckOtpButton(
              otpController: _otpController, // ✅
              email: widget.email,
              phone: widget.phone,
              password: widget.password,
              forRegister: widget.forRegister,
            ),
          ],
        ),
      ),
    );
  }
}
