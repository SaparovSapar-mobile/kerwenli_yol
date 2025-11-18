import 'package:flutter/material.dart';
import 'package:kerwenli_yol/examples.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_brands/parts/home_brands_card.dart';

class HomeBrandsList extends StatelessWidget {
  const HomeBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeBrandsCard(
          text: homeParts[index],
          isFirst: index == 0,
          isLast: index == homeParts.length - 1,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: homeParts.length,
      ),
    );
  }
}
