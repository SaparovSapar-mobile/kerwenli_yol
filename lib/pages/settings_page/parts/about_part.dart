import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/about_us_page/about_us_page.dart';
import 'package:kerwenli_yol/pages/contact_us_page/contact_us_page.dart';
import 'package:kerwenli_yol/pages/privacy_policy_page/privacy_policy_page.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/pages/write_message_page/write_message_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class AboutPart extends ConsumerWidget {
  const AboutPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ====== Colors. ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lang.aboutUs),
          SizedBox(height: 5),
          SettingPartCard(
            index: 4,
            text: lang.aboutTheCompany,
            icon: Icons.info,
            onTap: () => goToPage(
              context,
              AboutUsPage(),
              AxisDirection.left,
              name: 'about_us',
            ),
          ),
          SettingPartCard(
            index: 5,
            text: lang.contactUs,
            icon: Icons.support_agent,
            onTap: () => goToPage(
              context,
              ContactUsPage(),
              AxisDirection.left,
              name: 'contact_us',
            ),
          ),
          SettingPartCard(
            index: 6,
            text: lang.writeMessage,
            icon: Icons.forum,
            onTap: () => goToPage(
              context,
              WriteMessagePage(),
              AxisDirection.left,
              name: 'write_message',
            ),
          ),
          SettingPartCard(
            index: 7,
            text: lang.privacyPolicy,
            icon: Icons.privacy_tip,
            onTap: () => goToPage(
              context,
              PrivacyPolicyPage(),
              AxisDirection.left,
              name: 'privacy_policy',
            ),
          ),
        ],
      ),
    );
  }
}
