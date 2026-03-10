import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_marks_shimmer/mark_types_shimmer.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_marks_shimmer/marks_shimmer.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/parts/home_more_button_shimmer.dart';

class HomeMarksShimmer extends StatelessWidget {
  const HomeMarksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeMoreButtonShimmer(),
          SizedBox(height: 10),
          MarkTypesShimmer(),
          SizedBox(height: 5),
          MarksShimmer(),
          SizedBox(height: 5),
          MarksShimmer(),
        ],
      ),
    );
  }
}
