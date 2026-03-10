import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_best_companies_shimmer/home_best_company_shimmer_card.dart';

class MarksShimmer extends StatelessWidget {
  const MarksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeBestCompaniesCardHeight,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeBestCompanyShimmerCard(),
        separatorBuilder: (_, _) => SizedBox(width: 5),
        itemCount: 6,
      ),
    );
  }
}
