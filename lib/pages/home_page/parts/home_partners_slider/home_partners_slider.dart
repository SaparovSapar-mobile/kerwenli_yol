import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners_slider/parts/hps_tabs.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomePartnersSlider extends StatelessWidget {
  const HomePartnersSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeMoreButton(text: 'Yerli markalary', onTap: () {}),
          HpsTabs(),
          AppBarBottomLine(thickness: 10),
        ],
      ),
    );
  }
}
