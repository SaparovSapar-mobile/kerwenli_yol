import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/forgot_password_page/parts/fp_with_email.dart';
import 'package:kerwenli_yol/pages/forgot_password_page/parts/fp_with_phone.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/theme_switcher_button.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  final GlobalKey<FormState> formKeyForPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForEmail = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;
    Color formBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackLeadingButton(),
          title: Text('Parolymy Unutdym'),
          backgroundColor: bgColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 16),
              child: ThemeSwitcherButton(),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(94),
            child: Column(
              children: [
                AppBarBottomLine(),
                SizedBox(height: 24),
                SelectionButton(title1: 'Telefon Belgi', title2: 'Email'),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.only(left: 16, right: 16),
          child: TabBarView(
            children: [
              FpWithPhone(
                formKey: formKeyForPhone,
                phoneCtrl: _phoneCtrl,
                formBgColor: formBgColor,
                passwordCtrl: _passwordCtrl,
              ),
              FpWithEmail(
                formKey: formKeyForEmail,
                emailCtrl: _emailCtrl,
                formBgColor: formBgColor,
                passwordCtrl: _passwordCtrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
