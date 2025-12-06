import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/onboard_next_button.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/onboard_part.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/theme_switcher_button.dart';
import 'package:kerwenli_yol/pages/parts/dotss_indicator.dart';
import 'package:kerwenli_yol/providers/pages/onboard.dart';

class OnboardPage extends ConsumerStatefulWidget {
  const OnboardPage({super.key});

  @override
  ConsumerState<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends ConsumerState<OnboardPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnboardPart(
        image: 'onboard_1.png',
        title: 'Welcome to App',
        desc: 'The world full of amazing things to discover...',
      ),
      OnboardPart(
        image: 'onboard_2.png',
        title: 'Welcome to App',
        desc: 'The world full of amazing things to discover...',
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 60,
          top: screenProperties(context).topSafeArea + 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ThemeSwitcherButton(),
            SizedBox(height: 50),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) => pages[index],
                onPageChanged: (value) {
                  ref.read(onboardPageIndexProvider.notifier).state = value;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotssIndicator(
                  lenght: pages.length,
                  pageProvider: onboardPageIndexProvider,
                ),
                OnboardNextButton(pageCtrl: _pageController),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
