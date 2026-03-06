import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NewsPageShimmer extends ConsumerWidget {
  const NewsPageShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final double colorOpacity = isLight ? 1 : .1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(height: 24, width: 150.5),
                ShimmerContainer(height: 24, width: 24),
              ],
            ),
            Container(
              padding: EdgeInsetsGeometry.all(16),
              margin: EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  ShimmerContainer(
                    height: 208.12158203125,
                    width: double.maxFinite,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 58.902442932128906,
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ShimmerContainer(height: 58.902442932128906, width: 105),
                separatorBuilder: (_, _) => SizedBox(width: 6),
                itemCount: 5,
              ),
            ),
            SizedBox(height: 20),
            ShimmerContainer(height: 19, width: double.maxFinite),
            ShimmerContainer(
              height: 19,
              width: screenProperties(context).width * .5,
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(
                  height: 15.418450355529785,
                  width: 37.40073776245117,
                ),
                ShimmerContainer(
                  height: 15.418450355529785,
                  width: 37.40073776245117,
                ),
              ],
            ),
            SizedBox(height: 10),
            ShimmerContainer(height: 300, width: double.maxFinite),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
