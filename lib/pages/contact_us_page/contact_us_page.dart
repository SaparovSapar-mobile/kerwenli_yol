import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/contact_us_page/parts/contact_us_address.dart';
import 'package:kerwenli_yol/pages/contact_us_page/parts/contact_us_emails.dart';
import 'package:kerwenli_yol/pages/contact_us_page/parts/contact_us_phones.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class ContactUsPage extends ConsumerWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: homePageAppBar(context),
      body: ListView(
        children: [
          InternetStatusBar(),
          Container(
            margin: EdgeInsets.only(left: 16, top: 16, right: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: innerBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ContactUsPhones(),
          ),
          ContactUsEmails(),
          ContactUsAddress(),
        ],
      ),
    );
  }
}
