import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CpMessageBsListTile extends ConsumerWidget {
  const CpMessageBsListTile({
    super.key,
    required this.title,
    required this.index,
    required this.image,
    required this.companyId,
  });

  final String title, image, companyId;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(companyMessageListtileIndexProvider);
    final bool isActive = selectedIndex == index;

    // ===== Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color tralingIconColor = isLight
        ? LightColors.primary
        : DarkColors.primary;
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ===== Text Styles =======
    final TextStyle titleStyle = AppTextStyles.medium12;

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.only(left: 5, right: 10),
        leading: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Image.asset(
            'assets/images/$image',
            height: 16,
            width: 16,
            color: isActive ? tralingIconColor : iconColor,
          ),
        ),
        title: Text(title, style: titleStyle),
        trailing: isActive
            ? CircleAvatar(backgroundColor: tralingIconColor, radius: 3)
            : const SizedBox.shrink(),
        onTap: () async {
          final UserModel resultDb = await ref.read(getUserProvider.future);
          final bool hasUser = resultDb.id != '';
          if (!hasUser && context.mounted) {
            goToPage(context, LoginPage(), AxisDirection.left);
            return;
          }

          ref.read(companyMessageListtileIndexProvider.notifier).state = index;
          if (context.mounted) {
            showMessageBottomSheet(context, title, image, companyId);
          }
        },
      ),
    );
  }
}
