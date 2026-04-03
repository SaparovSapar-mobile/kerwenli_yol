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
import 'package:kerwenli_yol/providers/api/favorite.dart';
import 'package:kerwenli_yol/providers/database/favorite.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class CompanySubscribeButton extends ConsumerWidget {
  const CompanySubscribeButton({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color iconColor = isLight ? LightColors.primary : DarkColors.primary;

    final TextStyle textStyle = AppTextStyles.bold12;

    IconData icon = Icons.add_circle;

    final FavoriteModel dbParams = FavoriteModel(
      id: companyId,
      type: FavoriteTypeEnum.companyFollow,
    );
    final AsyncValue<bool> resultDB = ref.watch(
      hasInFavoritesProvider(dbParams),
    );

    return resultDB.when(
      data: (data) {
        if (data) {
          icon = Icons.check;
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
              addCompanyFollowProvider(params).future,
            );

            if (!result) {
              await addOrRemoveFromFavorites(dbParams);
              ref.invalidate(hasInFavoritesProvider(dbParams));
              if (context.mounted) {
                showErrorSnackbar(context, lang.somethingWentWrong);
              }
            } else {
              // ref.invalidate(fetchBookmarkedCompaniesProvider);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
            height: 26,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 16, color: iconColor),
                SizedBox(width: 4),
                Text('Agza bol', style: textStyle),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
