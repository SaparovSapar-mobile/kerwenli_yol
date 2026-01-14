import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class HomeVipCompanyCardCategories extends ConsumerWidget {
  const HomeVipCompanyCardCategories({
    super.key,
    this.iconSize,
    this.mainAxisAlignment,
  });

  final double? iconSize;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors =======
    bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;

    // ======== Text Styles ======
    TextStyle textStyle = AppTextStyles.medium10.copyWith(
      fontSize: iconSize ?? 6,
    );

    bool hasAligment = mainAxisAlignment != null;

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(color: bgColor),
        child: Row(
          mainAxisSize: hasAligment ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Category/sub category',
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            hasAligment ? SizedBox(width: 5) : const SizedBox.shrink(),
            Icon(Icons.arrow_forward_ios, size: iconSize ?? 6),
          ],
        ),
      ),
    );
  }
}
