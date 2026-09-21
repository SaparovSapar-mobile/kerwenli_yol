import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/enums/favorite_type.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/functions/user.dart';
import 'package:kerwenli_yol/helpers/methods/snackbars.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/add_p_favorite.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:kerwenli_yol/pages/login_page/login_page.dart';
import 'package:kerwenli_yol/providers/api/favorite.dart';
import 'package:kerwenli_yol/providers/api/product.dart';
import 'package:kerwenli_yol/providers/database/favorite.dart';
import 'package:kerwenli_yol/services/analytics_service.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class CardFavoriteButton extends ConsumerWidget {
  const CardFavoriteButton({
    super.key,
    this.width,
    this.height,
    this.iconSize,
    this.borderRadius,
    this.rightPosition,
    this.topPosition,
    required this.productId,
  });

  final double? width,
      height,
      iconSize,
      borderRadius,
      rightPosition,
      topPosition;
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    IconData icon = Icons.favorite_outline;

    final FavoriteModel dbParams = FavoriteModel(
      id: productId,
      type: FavoriteTypeEnum.product,
    );
    final AsyncValue<bool> resultDB = ref.watch(
      hasInFavoritesProvider(dbParams),
    );

    return Positioned(
      right: rightPosition ?? 4,
      top: topPosition ?? 4,
      child: resultDB.when(
        data: (data) {
          if (data) {
            icon = Icons.favorite;
            iconColor = isLight ? LightColors.error : DarkColors.error;
          }

          return GestureDetector(
            onTap: () async {
              final String userId = await getUserId();
              if (userId.isEmpty && context.mounted) {
                goToPage(
                  context,
                  LoginPage(),
                  AxisDirection.left,
                  name: 'login',
                );
                return;
              }

              await addOrRemoveFromFavorites(dbParams);
              ref.invalidate(hasInFavoritesProvider(dbParams));

              final AddPFavoriteModel params = AddPFavoriteModel(
                userId: userId,
                productId: productId,
              );
              final bool result = await ref.read(
                addProductFavoriteProvider(params).future,
              );

              if (!result) {
                await addOrRemoveFromFavorites(dbParams);
                ref.invalidate(hasInFavoritesProvider(dbParams));
                if (context.mounted) {
                  showErrorSnackbar(context, lang.somethingWentWrong);
                }
              } else {
                ref.invalidate(fetchLikedProductsProvider);
                AnalyticsService().logToggleBookmark(
                  added: !data,
                  contentType: 'product',
                  itemId: productId,
                );
              }
            },
            child: Container(
              width: width ?? 21,
              height: height ?? 21,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
              ),
              child: Icon(icon, size: iconSize ?? 12, color: iconColor),
            ),
          );
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }
}
