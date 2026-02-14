import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_categories_shimmer/home_category_shimmer_card.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/parts/home_more_button_shimmer.dart';

class HomeCategoriesShimmer extends StatelessWidget {
  const HomeCategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeMoreButtonShimmer(),
        SizedBox(height: 10),
        Container(
          height: homeCategoriesCardHeight,
          padding: const EdgeInsets.only(left: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HomeCategoryShimmerCard(),
            separatorBuilder: (_, _) => SizedBox(width: 5),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
