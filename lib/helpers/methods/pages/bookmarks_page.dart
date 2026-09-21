import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/bookmark_search_field.dart';
import 'package:kerwenli_yol/pages/parts/circle_button.dart';
import 'package:kerwenli_yol/providers/pages/bookmarks_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

AppBar bookmarsPageAppBar(BuildContext context) {
  final AppLocalizations lang = AppLocalizations.of(context)!;

  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(18),
      child: Consumer(
        builder: (context, ref, widget) {
          // ======= Colors =======
          final bool isLight = isLightTheme(context, ref);
          final Color bgColor = isLight
              ? LightColors.bgBlogLight
              : DarkColors.bgBlogDark;

          return Container(
            padding: EdgeInsets.only(left: 16, top: 10, right: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // при открытом поиске поле занимает всю строку вместо
                // заголовка и кнопок - высота шапки не меняется
                if (ref.watch(bookmarkSearchOpenProvider))
                  const BookmarkSearchField()
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(lang.bookmark),
                      SizedBox(
                        height: 38,
                        child: Row(
                          children: [
                            CircleButton(
                              icon: Icons.search,
                              onTap: () =>
                                  ref
                                          .read(
                                            bookmarkSearchOpenProvider.notifier,
                                          )
                                          .state =
                                      true,
                            ),
                            SizedBox(width: 10),
                            CircleButton(
                              icon: Icons.more_vert,
                              onTap: () =>
                                  showBookmarkSettingBottomSheet(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                AppBarBottomLine(thickness: 2),
              ],
            ),
          );
        },
      ),
    ),
  );
}
