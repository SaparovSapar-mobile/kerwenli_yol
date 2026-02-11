import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/user_profile_page/parts/user_profile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: UserProfile(user: user, forUserPage: true),
    );
  }
}
