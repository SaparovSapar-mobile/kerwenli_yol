import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/companies_page/companies_page.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
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
    final bool isLight = isLightTheme(context, ref);
    final Color leadingBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color activeLeadingBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;

    // ======= Text Styles ========
    final TextStyle titleStyle = AppTextStyles.medium12;

    final String selectedCategory = ref.watch(categoryProvider);
    final String categoryId = category.id;
    final bool isActive = selectedCategory == categoryId;

    // ====== Name ======
    final String name = translateText(
      ref,
      category.nameTm,
      category.nameRu,
      category.nameEn,
    );

    // ====== Image ======
    final String image = translateText(
      ref,
      category.imageTm,
      category.imageRu,
      category.imageEn,
    );

    return Container(
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          ref.read(categoryProvider.notifier).state = categoryId;
          goToPage(
            context,
            CompaniesPage(categoryId: categoryId),
            AxisDirection.left,
          );
        },
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isActive ? activeLeadingBgColor : leadingBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: SizedBox(
            height: 16,
            width: 16,
            child: ShowNetwImage(image: image),
          ),
        ),
        title: Text(name, style: titleStyle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
      ),
    );
  }
}
