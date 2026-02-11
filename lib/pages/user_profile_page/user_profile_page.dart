import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ====== Colors ========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: homePageAppBar(context),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: ListView(children: [UserProfile(user: user, forUserPage: true)]),
      ),
    );
  }
}
