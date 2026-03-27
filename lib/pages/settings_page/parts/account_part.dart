import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/pages/settings_page/parts/setting_part_card.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class AccountPart extends ConsumerWidget {
  const AccountPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    final AsyncValue<String> resultDb = ref.watch(getUserIdProvider);

    return resultDb.when(
      data: (data) {
        if (data == '') {
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
              Text('Akkount'),
              SizedBox(height: 5),
              SettingPartCard(
                index: 8,
                text: 'Akkountdan cykmak',
                icon: Icons.logout,
                onTap: () => showLougOutBottomSheet(context),
              ),
              SettingPartCard(
                index: 9,
                text: 'Hasabymy pozmak',
                icon: Icons.delete_forever,
                onTap: () {},
              ),
            ],
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
