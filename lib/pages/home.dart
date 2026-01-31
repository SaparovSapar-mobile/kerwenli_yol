import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/bottom_navigation_page.dart';
import 'package:kerwenli_yol/pages/onboard_page/onboard_page.dart';
import 'package:kerwenli_yol/pages/main_pass_code_page/main_pass_code_page.dart';
import 'package:kerwenli_yol/providers/pages/settings_page.dart';
import 'package:kerwenli_yol/providers/settings.dart';

class AppHome extends ConsumerWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFirstTime = ref.read(isFirstTimeProvider);
    int passCode = ref.read(passCodeProvider);

    bool hasPassCode = passCode != 0;

    if (isFirstTime) {
      return const OnboardPage();
    } else if (hasPassCode) {
      return MainPassCodePage();
    } else {
      return const BottomNavigationPage();
    }
  }
}
