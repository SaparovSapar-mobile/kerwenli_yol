import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_companies_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeVirtuals extends StatelessWidget {
  const HomeVirtuals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: '360° gezelenç', onTap: () {}),
        SizedBox(height: 5),
        HomeVipCompaniesList(),
        SizedBox(height: 10),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
