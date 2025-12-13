import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners/parts/home_partner_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomePartners extends StatelessWidget {
  const HomePartners({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Hyzmadaslarymyz', onTap: () {}),
        SizedBox(height: 5),
        HomePartnerList(),
        SizedBox(height: 10),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
