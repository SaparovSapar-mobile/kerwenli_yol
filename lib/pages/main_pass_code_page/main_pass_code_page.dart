import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/main_pass_code_page/parts/main_pass_code_input.dart';
import 'package:kerwenli_yol/pages/main_pass_code_page/parts/main_pass_lock_button.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class MainPassCodePage extends ConsumerWidget {
  const MainPassCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors ===========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
          InternetStatusBar(),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: innerBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainPassLockButton(),
                SizedBox(height: 10),
                MainPassCodeInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
