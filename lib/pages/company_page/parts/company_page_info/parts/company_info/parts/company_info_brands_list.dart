import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/models/brand.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanyInfoBrandsList extends ConsumerWidget {
  const CompanyInfoBrandsList({super.key, required this.brands});

  final List<BrandModel> brands;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final BrandModel brand = brands[index];
          final String name = translateText(
            ref,
            brand.nameTm,
            brand.nameRu,
            brand.nameEn,
            brand.nameTr,
          );

          return GestureDetector(
            onTap: brand.individualUuid.isEmpty
                ? null
                : () => goToPage(
                    context,
                    CompanyPage(companyId: brand.individualUuid),
                    AxisDirection.left,
                  ),
            child: SizedBox(
              width: 65,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 65,
                    width: 65,
                    child: brand.logoImg.isEmpty
                        ? const SizedBox.shrink()
                        : ShowNetwImage(image: brand.logoImg, borderRadius: 8),
                  ),
                  SizedBox(height: 4),
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular12,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: brands.length,
      ),
    );
  }
}
