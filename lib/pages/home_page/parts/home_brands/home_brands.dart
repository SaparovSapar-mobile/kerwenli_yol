import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_brands/parts/home_brands_list.dart';
import 'package:kerwenli_yol/pages/parts/more_button.dart';

class HomeBrands extends StatelessWidget {
  const HomeBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoreButton(text: 'Türkmenistanyň markalary'),
        SizedBox(height: 5),
        HomeBrandsList(),
      ],
    );
  }
}
