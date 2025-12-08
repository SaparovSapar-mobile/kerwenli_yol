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

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            preferredSize: const Size.fromHeight(78),
            child: Column(
              children: [
                AppBarBottomLine(),
                SizedBox(height: 24),
                SelectionButton(title1: 'Telefon Belgi', title2: 'Email'),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: TabBarView(
            children: [RegisterWithPhone(), RegisterWithEmail()],
          ),
        ),
      ),
    );
  }
}
