import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/models/sub_category.dart';
import 'package:kerwenli_yol/pages/companies_page/companies_page.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/providers/pages/categories_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CategoryCard extends ConsumerWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

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
    final TextStyle titleStyle = AppTextStyles.medium14;

    final String selectedCategory = ref.watch(categoryProvider);
    final String categoryId = category.id;
    final bool isActive = selectedCategory == categoryId;

    // ====== Name ======
    final String name = translateText(
      ref,
      category.nameTm,
      category.nameRu,
      category.nameEn,
      category.nameEn,
    );

    // ====== Image ======
    final String image = translateText(
      ref,
      category.imageTm,
      category.imageRu,
      category.imageEn,
      category.imageEn,
    );

    final List<SubCategoryModel> subCategories = category.subCategories;

    void openCompanies(String? subCategoryId) {
      ref.read(categoryProvider.notifier).state = categoryId;
      goToPage(
        context,
        CompaniesPage(categoryId: categoryId, subCategoryId: subCategoryId),
        AxisDirection.left,
        name: 'companies',
      );
    }

    final Widget leadingIcon = Container(
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
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? leadingBgColor : activeLeadingBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: subCategories.isEmpty
          ? ListTile(
              onTap: () => openCompanies(null),
              leading: leadingIcon,
              title: Text(name, style: titleStyle),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: iconColor,
              ),
            )
          : Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                onExpansionChanged: (_) =>
                    ref.read(categoryProvider.notifier).state = categoryId,
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.only(left: 44, bottom: 6),
                leading: leadingIcon,
                title: Text(name, style: titleStyle),
                children: [
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    onTap: () => openCompanies(null),
                    title: Text(
                      lang.all,
                      style: AppTextStyles.medium12.copyWith(color: iconColor),
                    ),
                  ),
                  ...subCategories.map((sub) {
                    final String subName = translateText(
                      ref,
                      sub.nameTm,
                      sub.nameRu,
                      sub.nameEn,
                      sub.nameTr,
                    );

                    return ListTile(
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.zero,
                      onTap: () => openCompanies(sub.id),
                      title: Text(
                        subName,
                        style: AppTextStyles.regular12.copyWith(
                          color: iconColor,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
    );
  }
}
