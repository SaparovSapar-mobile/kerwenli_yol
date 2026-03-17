import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/enums/favorite_type.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/user.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/add_c_bookmark.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/api/favorite.dart';
import 'package:kerwenli_yol/providers/database/favorite.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CardBookmarkButton extends ConsumerWidget {
  const CardBookmarkButton({
    super.key,
    this.bGColor,
    this.width,
    this.height,
    this.iconSize,
    this.borderRadius,
    this.icnColor,
    required this.companyId,
  });

  final Color? bGColor, icnColor;
  final double? width, height, iconSize, borderRadius;
  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    // ========= Colors =========
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgBlogLight : DarkColors.bgBlogDark;
    if (bGColor != null) {
      bgColor = bGColor!;
    }

    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    if (icnColor != null) {
      iconColor = icnColor!;
    }

    final FavoriteModel dbParams = FavoriteModel(
      id: companyId,
      type: FavoriteTypeEnum.company,
    );
    final AsyncValue<bool> resultDB = ref.watch(
      hasInFavoritesProvider(dbParams),
    );

    return resultDB.when(
      data: (data) {
        if (data) {
          iconColor = isLight ? LightColors.primary : DarkColors.primary;
          bgColor = iconColor.withValues(alpha: .2);
        }

        return GestureDetector(
          onTap: () async {
            final String userId = await getUserId();
            if (userId.isEmpty && context.mounted) {
              goToPage(context, LoginPage(), AxisDirection.left);
              return;
            }

            await addOrRemoveFromFavorites(dbParams);
            ref.invalidate(hasInFavoritesProvider(dbParams));

            final AddCBookmarkModel params = AddCBookmarkModel(
              userId: userId,
              companyId: companyId,
            );
            final bool result = await ref.read(
              addCompanyBookmarkProvider(params).future,
            );

            if (!result) {
              await addOrRemoveFromFavorites(dbParams);
              ref.invalidate(hasInFavoritesProvider(dbParams));
              if (context.mounted) {
                showErrorSnackbar(context, lang.somethingWentWrong);
              }
            } else {
              ref.invalidate(fetchBookmarkedCompaniesProvider);
            }
          },
          child: Container(
            width: width ?? 21,
            height: height ?? 21,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.bookmark, size: iconSize ?? 12, color: iconColor),
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
