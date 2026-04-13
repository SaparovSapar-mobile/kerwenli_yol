import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile_info_card.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class UserProfileInfoMessages extends ConsumerWidget {
  const UserProfileInfoMessages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ====== Colors ========
    final bool isLight = isLightTheme(context, ref);
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ====== Text Styles ========
    final TextStyle titleStyle = AppTextStyles.medium20;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: innerBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sesli gelen hatlar',
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: userProfileInfoCardHeight,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                mainAxisExtent: 88,
              ),
              children: [
                UserProfileInfoCard(
                  onTap: () {},
                  icon: Icons.corporate_fare,
                  text: 'Bildirisler',
                  countText: '3',
                ),
                UserProfileInfoCard(
                  onTap: () {},
                  icon: Icons.group,
                  text: lang.news,
                  countText: '150 K',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
