import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile_info_card.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors ========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ====== Text Styles ========
    TextStyle titleStyle = AppTextStyles.medium20;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: homePageAppBar(context),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            UserProfile(user: user, forUserPage: true),
            SizedBox(height: 5),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: innerBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    mainAxisExtent: 88,
                  ),
                  children: [
                    UserProfileInfoCard(
                      icon: Icons.corporate_fare,
                      text: 'Menin karhanalarym',
                      countText: '3',
                    ),
                    UserProfileInfoCard(
                      icon: Icons.group,
                      text: 'Doslarym',
                      countText: '150 K',
                    ),
                    UserProfileInfoCard(
                      icon: Icons.bookmark,
                      text: 'Halanlarym',
                      countText: '150 K',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
