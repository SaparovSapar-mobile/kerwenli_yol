import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_navigation.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/bookmark_page.dart';
import 'package:kerwenli_yol/pages/home_page/home_page.dart';
import 'package:kerwenli_yol/pages/search_page.dart';
import 'package:kerwenli_yol/pages/settings_page/settings_page.dart';
import 'package:kerwenli_yol/providers/pages/bottom_navigation.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);
    Color activeTextColor = isLight ? LightColors.primary : DarkColors.primary;
    Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleLight;
    Color itemBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    TextStyle textStyle = AppTextStyles.medium10;

    int selectedIndex = ref.watch(selectedBottomIndexProvider);
    AppBar appBar = homePageAppBar(context);

    List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
      const BookmarkPage(),
      const SettingsPage(),
    ];

    switch (selectedIndex) {
      case 0:
        appBar = homePageAppBar(context);
        break;
      case 1:
        appBar = homePageAppBar(context);
        break;
      case 2:
        appBar = homePageAppBar(context);
        break;
      case 3:
        appBar = homePageAppBar(context);
        break;
      default:
        appBar = homePageAppBar(context);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: IndexedStack(index: selectedIndex, children: pages),
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
            bottomNavBarItem(Icons.home, 'Home', selectedIndex == 0, isLight),
            bottomNavBarItem(
              Icons.search,
              'Search',
              selectedIndex == 1,
              isLight,
            ),
            bottomNavBarItem(
              Icons.bookmark,
              'Book Mark',
              selectedIndex == 2,
              isLight,
            ),
            bottomNavBarItem(
              Icons.settings,
              'Setting',
              selectedIndex == 3,
              isLight,
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            ref.read(selectedBottomIndexProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}
