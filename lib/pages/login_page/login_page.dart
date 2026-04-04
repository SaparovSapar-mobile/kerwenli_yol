import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/login_page/parts/login_with_email.dart';
import 'package:kerwenli_yol/pages/login_page/parts/login_with_phone.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/theme_switcher_button.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
    // ======= Colors ========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color formBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackLeadingButton(),
          title: Text('Ulgama Girmek'),
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
              LoginWithPhone(
                formKey: formKeyForPhone,
                phoneCtrl: _phoneCtrl,
                passwordCtrl: _passwordCtrl,
                formBgColor: formBgColor,
              ),
              LoginWithEmail(
                formKey: formKeyForEmail,
                emailCtrl: _emailCtrl,
                passwordCtrl: _passwordCtrl,
                formBgColor: formBgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
