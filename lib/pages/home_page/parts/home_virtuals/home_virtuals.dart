import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_virtuals/parts/home_virtuals_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeVirtuals extends StatelessWidget {
  const HomeVirtuals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: '360° gezelenç', onTap: () {}),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: HomeVirtualsList(),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
