import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';

class MarkTypesShimmer extends StatelessWidget {
  const MarkTypesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeMarkTypeHeight,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ShimmerContainer(
          height: homeMarkTypeHeight,
          width: 60.177398681640625,
        ),
        separatorBuilder: (_, _) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
