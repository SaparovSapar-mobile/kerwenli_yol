import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_media_shimmer/home_media_card_shimmer.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/parts/home_more_button_shimmer.dart';

class HomeMediaShimmer extends StatelessWidget {
  const HomeMediaShimmer({super.key});

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
            height: mediaCardHeight,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HomeMediaCardShimmer(),
              separatorBuilder: (_, _) => SizedBox(width: 6),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
