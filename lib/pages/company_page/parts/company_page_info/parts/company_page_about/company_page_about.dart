import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:kerwenli_yol/enums/social_type.dart';
import 'package:kerwenli_yol/helpers/functions/send.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/maps.dart';
import 'package:kerwenli_yol/models/social.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/company_page/company_banners/parts/company_banner.dart';
import 'package:kerwenli_yol/pages/parts/open_location_list_tile.dart';
import 'package:kerwenli_yol/pages/parts/open_social_list_tile.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

import 'expanded_html.dart';

class CompanyPageAbout extends ConsumerWidget {
  const CompanyPageAbout({super.key, required this.company});

  final CompanyDetailModel company;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ========== Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ========== Text Styles ==========
    final TextStyle textStyle = AppTextStyles.semiBold14;

    // ======= company translation =======
    final TranslationModel compDesc = company.description;
    final String desc = translateText(
      ref,
      compDesc.tm,
      compDesc.ru,
      compDesc.en,
      compDesc.en,
    );

    // ======= company banners =======
    final CompContactModel contact = company.contact;
    final List<dynamic> banners = company.banners;
    final bool hasBanners = banners.isNotEmpty;

    // ======= company phones =======
    final List<dynamic> phones = contact.phones;

    // ======= company address =======
    final TranslationModel compAddress = company.address;
    final String address = translateText(
      ref,
      compAddress.tm,
      compAddress.ru,
      compAddress.en,
      compAddress.en,
    );

    // ======= company socials =======
    final List<SocialModel> socials = contact.socials;
    final bool hasSocials = socials.isNotEmpty;
    String email = '';
    if (hasSocials) {
      for (final SocialModel social in socials) {
        if (social.type == SocialType.mail) {
          email = social.value;
        }
      }
    }

    // ======= company map =======
    final MapsModel compMap = company.maps;
    final bool hasMap = compMap.url != '';

    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Container(
        padding: EdgeInsetsGeometry.all(8),
        decoration: BoxDecoration(
          color: innerBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lang.aboutUs, style: textStyle),
            if (hasBanners)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CompanyBanner(
                  images: banners,
                  height: 100,
                  width: double.infinity,
                  borderRadius: 8,
                  dotsLeft: 4,
                  dotsBottom: 4,
                  dotsSize: 4.0,
                  dotsActiveWidth: 9.0,
                  dotsActiveHeight: 4.0,
                ),
              ),
            ExpandableHtmlText(desc: desc),
            SizedBox(height: 20),
            Text(lang.forContact, style: textStyle),
            if (phones.isNotEmpty)
              ...phones.map(
                (e) => OpenSocialListTile(
                  icon: 'call.png',
                  text: e.toString(),
                  onTap: () async {
                    await launchPhone(e.toString());
                  },
                ),
              ),
            if (email != '')
              OpenSocialListTile(
                icon: 'mail.png',
                text: email,
                onTap: () async {
                  await sendEmail(email);
                },
              ),
            OpenSocialListTile(
              icon: 'location.png',
              text: parse(address).body!.text,
              onTap: () {},
            ),
            SizedBox(height: 20),
            Text(lang.socialMediaLinks, style: textStyle),
            if (hasSocials)
              ...socials.map((e) {
                Widget rWidget = const SizedBox.shrink();

                switch (e.type) {
                  case SocialType.tiktok:
                    rWidget = OpenSocialListTile(
                      icon: 'tiktok.png',
                      text: e.value,
                      onTap: () async {
                        await openSocial(
                          e.value,
                          SocialType.tiktok,
                        ); // 👈 передаём type
                      },
                    );
                    break;
                  case SocialType.instagram:
                    rWidget = OpenSocialListTile(
                      icon: 'instagram.png',
                      text: e.value,
                      onTap: () async {
                        await openSocial(e.value, SocialType.instagram); 
                      },
                    );
                    break;
                  case SocialType.telegram:
                    rWidget = OpenSocialListTile(
                      icon: 'telegram.png',
                      text: e.value,
                      onTap: () async {
                        await openSocial(e.value, SocialType.telegram);
                      },
                    );
                    break;
                  case SocialType.whatsapp:
                    rWidget = OpenSocialListTile(
                      icon: 'whatsapp.png',
                      text: e.value,
                      onTap: () async {
                        await openSocial(e.value, SocialType.whatsapp);
                      },
                    );
                    break;
                  case SocialType.linkedin:
                    rWidget = OpenSocialListTile(
                      icon: 'linkedin.png',
                      text: e.value,
                      onTap: () async {
                        await openSocial(e.value, SocialType.linkedin);
                      },
                    );
                    break;
                  default:
                    rWidget = const SizedBox.shrink();
                }

                return rWidget;
              }),
            SizedBox(height: 20),
            Text(lang.ourLocationMap, style: textStyle),
            SizedBox(height: 10),
            if (hasMap)
              SizedBox(
                width: double.maxFinite,
                height: 150,
                child: ShowImage(
                  image: 'assets/examples/cropped_map.png',
                  borderRadius: 10,
                ),
              ),
            SizedBox(height: 20),
            OpenLocationListTile(),
          ],
        ),
      ),
    );
  }
}
