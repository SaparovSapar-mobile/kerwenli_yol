import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_sponsors_shimmer/home_sponsor_shimmer_card.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/parts/home_more_button_shimmer.dart';

class HomeSponsorsShimmer extends StatelessWidget {
  const HomeSponsorsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeMoreButtonShimmer(),
          SizedBox(height: 10),
          SizedBox(
            height: homeSponsorsHeight,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HomeSponsorShimmerCard(),
              separatorBuilder: (_, _) => SizedBox(width: 5),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
