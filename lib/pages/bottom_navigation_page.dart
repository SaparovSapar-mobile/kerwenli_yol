import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_navigation.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/helpers/methods/pages/search_page.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/home_page/home_page.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/scroll_to_top_button.dart';
import 'package:kerwenli_yol/pages/search_page/search_page.dart';
import 'package:kerwenli_yol/pages/settings_page/settings_page.dart';
import 'package:kerwenli_yol/providers/pages/bottom_navigation.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/providers/parts/scroll_to_top.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color activeTextColor = isLight
        ? LightColors.primary
        : DarkColors.primary;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleLight;
    final Color itemBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    // ======= Text Styles =========
    final TextStyle textStyle = AppTextStyles.medium10;

    final int selectedIndex = ref.watch(selectedBottomIndexProvider);
    final bool openToTop = ref.watch(mainPageOpenToTopProvider);
    final bool selectMainPage = selectedIndex == 0;
    final bool showScrollToTopButton = openToTop && selectMainPage;

    AppBar appBar = homePageAppBar(context);

    final List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
      // const BookmarkPage(),
      const SettingsPage(),
    ];

    switch (selectedIndex) {
      case 0:
        appBar = homePageAppBar(context);
        break;
      case 1:
        appBar = searchPageAppBar(context);
        break;
      // case 2:
      //   appBar = bookmarsPageAppBar(context);
      // break;
      case 2:
        appBar = homePageAppBar(context);
        break;
      default:
        appBar = homePageAppBar(context);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Stack(
        children: [
          Column(
            children: [
              InternetStatusBar(),
              Expanded(
                child: IndexedStack(index: selectedIndex, children: pages),
              ),
            ],
          ),
          if (showScrollToTopButton)
            ScrollToTopButton(provider: mainPageScrollCtrlProvider),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: textStyle,
          unselectedLabelStyle: textStyle,
          selectedItemColor: activeTextColor,
          unselectedItemColor: textColor,
          backgroundColor: itemBgColor,
          items: [
            bottomNavBarItem(
              Icons.home,
              lang.home,
              selectedIndex == 0,
              isLight,
            ),
            bottomNavBarItem(
              Icons.search,
              lang.search,
              selectedIndex == 1,
              isLight,
            ),
            // bottomNavBarItem(
            //   Icons.bookmark,
            //   'Book Mark',
            //   selectedIndex == 2,
            //   isLight,
            // ),
            bottomNavBarItem(
              Icons.settings,
              'Setting',
              selectedIndex == 2,
              isLight,
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            ref.read(selectedBottomIndexProvider.notifier).state = value;

            // Eger user Search sahypada dal bolsa
            // onda search history acyk bolmaly
            // we search edilen soz arassalanmaly
            if (value != 1) {
              ref.read(eCommerceSearchProvider.notifier).state = '';
              ref.read(openSearchECommerceHistoryProvider.notifier).state =
                  true;
            }
          },
        ),
      ),
    );
  }
}
