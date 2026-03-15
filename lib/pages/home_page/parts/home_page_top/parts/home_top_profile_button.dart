import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class HomeTopProfileButton extends ConsumerWidget {
  const HomeTopProfileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;
    final Color activeColor = isLight
        ? LightColors.newCard
        : DarkColors.newCard;

    final AsyncValue<String> resultDB = ref.watch(getUserIdProvider);

    return resultDB.when(
      data: (data) {
        final bool hasUser = data != '';

        return GestureDetector(
          onTap: () async {
            if (hasUser) {
              return;
            }

            if (context.mounted) {
              goToPage(context, LoginPage(), AxisDirection.left);
            }
          },
          child: Container(
            padding: EdgeInsets.all(8.5),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Icon(Icons.account_circle, color: iconColor, size: 18),
                if (hasUser)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: iconBgColor,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(1),
                        child: CircleAvatar(
                          backgroundColor: activeColor,
                          radius: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
