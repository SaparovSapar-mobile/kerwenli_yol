import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_gratitudes_shimmer/home_gratitude_shimmer_card.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/parts/home_more_button_shimmer.dart';

class HomeGratitudesShimmer extends StatelessWidget {
  const HomeGratitudesShimmer({super.key});

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
            height: homeGratutitudesHeight,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HomeGratitudeShimmerCard(),
              separatorBuilder: (_, _) => SizedBox(width: 5),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
