import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/bottom_navigation.dart';
import 'package:kerwenli_yol/pages/bookmark_page.dart';
import 'package:kerwenli_yol/pages/home_page.dart';
import 'package:kerwenli_yol/pages/search_page.dart';
import 'package:kerwenli_yol/pages/settings_page.dart';
import 'package:kerwenli_yol/providers/pages/bottom_navigation.dart';

class BottomNavigationPage extends ConsumerWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(selectedBottomIndexProvider);

    List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
      const BookmarkPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            bottomNavBarItem(Icons.home, 'Home', selectedIndex == 0),
            bottomNavBarItem(Icons.search, 'Search', selectedIndex == 1),
            bottomNavBarItem(Icons.bookmark, 'Book Mark', selectedIndex == 2),
            bottomNavBarItem(Icons.settings, 'Setting', selectedIndex == 3),
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
