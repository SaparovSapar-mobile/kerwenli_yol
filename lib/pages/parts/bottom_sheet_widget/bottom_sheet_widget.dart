import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/top_widget_of_bottom_navigation.dart';
import 'package:kerwenli_yol/styles/decoration_styles.dart';

class BottomSheetWidget extends ConsumerWidget {
  const BottomSheetWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLight = isLightTheme(context, ref);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          const TopWidgetOfBottomNavigation(),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            decoration: bottomNavigationBoxDecoration(isLight),
            child: Column(mainAxisSize: MainAxisSize.min, children: children),
          ),
        ],
      ),
    );
  }
}
