import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile_info_card.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class UserProfileInfoViews extends ConsumerWidget {
  const UserProfileInfoViews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors ========
    final bool isLight = isLightTheme(context, ref);
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ====== Text Styles ========
    TextStyle titleStyle = AppTextStyles.medium20;

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
            'Gorulmeler',
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: userProfileInfoCardHeight,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                mainAxisExtent: 88,
              ),
              children: [
                UserProfileInfoCard(
                  icon: Icons.favorite,
                  text: 'Likeler',
                  countText: '3',
                ),
                UserProfileInfoCard(
                  icon: Icons.preview,
                  text: 'Gorulme',
                  countText: '150 K',
                ),
                UserProfileInfoCard(
                  icon: Icons.person_search,
                  text: 'Gozlenenler',
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
