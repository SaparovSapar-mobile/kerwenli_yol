import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/theme_switcher_button.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';
import 'package:kerwenli_yol/pages/register_page/parts/register_with_email.dart';
import 'package:kerwenli_yol/pages/register_page/parts/register_with_phone.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _fullNameCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _fullNameCtrl.dispose();
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
          title: Text('Agza bolmak'),
          backgroundColor: bgColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 16),
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
              RegisterWithPhone(
                formBgColor: formBgColor,
                formKey: formKey,
                nameCtrl: _fullNameCtrl,
                phoneCtr: _phoneCtrl,
                passwordCtrl: _passwordCtrl,
              ),
              RegisterWithEmail(),
            ],
          ),
        ),
      ),
    );
  }
}
