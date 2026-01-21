import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
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
  });

  final String title, image;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(companyMessageListtileIndexProvider);
    bool isActive = selectedIndex == index;

    // ===== Colors =======
    bool isLight = isLightTheme(context, ref);
    Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color tralingIconColor = isLight ? LightColors.primary : DarkColors.primary;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ===== Text Styles =======
    TextStyle titleStyle = AppTextStyles.medium12;

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
          ref.read(companyMessageListtileIndexProvider.notifier).state = index;
          showMessageBottomSheet(context);
        },
      ),
    );
  }
}
