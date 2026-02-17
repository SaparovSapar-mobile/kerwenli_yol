import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/settings.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class LanguageListTile extends ConsumerWidget {
  const LanguageListTile({
    super.key,
    required this.title,
    required this.lang,
    required this.image,
  });

  final String title, lang, image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedLang = ref.watch(langProvider);
    bool isActive = selectedLang == lang;

    final bool isLight = isLightTheme(context, ref);
    Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color tralingIconColor = isLight ? LightColors.primary : DarkColors.primary;

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
          child: Image.asset('assets/images/$image', height: 16, width: 16),
        ),
        title: Text(title, style: titleStyle),
        trailing: isActive
            ? CircleAvatar(backgroundColor: tralingIconColor, radius: 3)
            : const SizedBox.shrink(),
        onTap: () async {
          await ref.read(langProvider.notifier).update(lang);
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
