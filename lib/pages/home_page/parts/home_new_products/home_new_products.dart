import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_new_products/parts/home_new_products_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeNewProducts extends StatelessWidget {
  const HomeNewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(text: 'Täze önümler', onTap: () {}),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: HomeNewProductsList(),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
