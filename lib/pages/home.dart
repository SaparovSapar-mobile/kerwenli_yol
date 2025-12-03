import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/onboard_page/onboard_page.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class AppHome extends ConsumerWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFirstTime = ref.watch(isFirstTimeProvider);

    if (isFirstTime) {
      return const OnboardPage();
    } else {
      return const BottomNavigationPage();
    }
  }
}
