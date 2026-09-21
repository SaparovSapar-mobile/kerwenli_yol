import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/edit_profile_page/edit_profile_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key, required this.user, required this.forUserPage});

  final UserModel user;
  final bool forUserPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ========= Text Styles ==========
    final TextStyle nameStyle = AppTextStyles.semiBold16;
    final TextStyle titleStyle = AppTextStyles.medium20;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              goToPage(
                context,
                EditProfilePage(user: user),
                AxisDirection.left,
                name: 'profile_edit',
              );
            },
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(lang.myPage, style: titleStyle),
            trailing: Icon(
              Icons.drive_file_rename_outline,
              size: 24,
              color: iconColor,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF6F8FD),
                ),
                height: 57,
                width: 57,
                child: user.image == null
                    ? showImageMethod(user.image, 10, null)
                    : Center(
                        child: Text(
                          user.name.substring(0, 1),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: nameStyle,
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text("Müşderi", style: AppTextStyles.medium14),
                      ],
                    ),
                    // HomeVipCompanyCardCategories(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   iconSize: 8,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
