import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/providers/pages/categories_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors ========
    bool isLight = isLightTheme(context, ref);
    Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ======= Text Styles ========
    TextStyle titleStyle = AppTextStyles.medium12;

    String selectedCategory = ref.watch(categoryProvider);
    String categoryId = category.id;
    bool isActive = selectedCategory == categoryId;

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () => ref.read(categoryProvider.notifier).state = categoryId,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Image.asset(
            height: 16,
            width: 16,
            'assets/examples/category_icon.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text('Saglyk we bejeris merkezleri', style: titleStyle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
      ),
    );
  }
}
