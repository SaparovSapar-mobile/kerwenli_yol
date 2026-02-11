import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/parts/home_vip_company_card_categories.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class UserProfilePart extends ConsumerWidget {
  const UserProfilePart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ==========
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ========= Text Styles ==========
    TextStyle nameStyle = AppTextStyles.medium12;
    TextStyle titleStyle = AppTextStyles.medium20;

    AsyncValue<UserModel> resultDB = ref.watch(getUserProvider);

    return resultDB.when(
      data: (data) {
        bool noUser = data.id == '' || data.token == '';
        if (noUser) {
          return const SizedBox.shrink();
        }

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
                onTap: () {},
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text('Menin sahypam', style: titleStyle),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: iconColor,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 46,
                    width: 46,
                    child: showImageMethod(data.image, 10, null),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: nameStyle,
                        ),
                        SizedBox(height: 2),
                        HomeVipCompanyCardCategories(
                          mainAxisAlignment: MainAxisAlignment.start,
                          iconSize: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
