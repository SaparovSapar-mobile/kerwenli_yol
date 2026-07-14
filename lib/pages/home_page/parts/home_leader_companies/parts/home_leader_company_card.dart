import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/image_and_video.dart';
import 'package:kerwenli_yol/pages/company_page/company_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

import '../../../../../helpers/methods/static_data.dart';

class HomeLeaderCompanyCard extends ConsumerWidget {
  const HomeLeaderCompanyCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.name,
    required this.companyId,
    required this.image,
  });

  final bool? isFirst, isLast;
  final String name, companyId, image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========= Colors ==========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    // ========= Text Styles ==========
    final TextStyle textStyle = AppTextStyles.medium12;
    return GestureDetector(
      onTap: () {
        print('Company iddd: $companyId');

        goToPage(
          context,
          CompanyPage(companyId: companyId),
          AxisDirection.left,
        );
      },
      child: Container(
        margin: isFirst != null && isLast != null
            ? EdgeInsets.only(left: isFirst! ? 8 : 8, right: isLast! ? 8 : 0)
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: bgColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(5),
                child: CachedNetworkImage(
                  imageUrl: '$pathUrl/$image',
                  height: 90,
                  width: 140,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => errImage,
                  placeholder: (context, url) => errImage,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
