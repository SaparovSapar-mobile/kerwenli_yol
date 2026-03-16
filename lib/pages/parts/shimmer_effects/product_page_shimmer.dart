import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProductPageShimmer extends ConsumerWidget {
  const ProductPageShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);
    final double colorOpacity = isLight ? 1 : .1;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Shimmer(
        colorOpacity: colorOpacity,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ShimmerContainer(height: 49, width: double.maxFinite),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerContainer(height: 20, width: 72),
                      ShimmerContainer(height: 20, width: 72),
                    ],
                  ),
                  ShimmerContainer(height: 328, width: double.maxFinite),
                  SizedBox(height: 11),
                  ShimmerContainer(height: 16, width: 300),
                  ShimmerContainer(height: 16, width: 150),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 11, width: 34),
                      ShimmerContainer(height: 11, width: 34),
                    ],
                  ),
                  SizedBox(height: 8),
                  ShimmerContainer(height: 16.38034439086914, width: 129),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 11, width: 34),
                      ShimmerContainer(height: 11, width: 34),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(height: 14, width: 60),
                  SizedBox(height: 10),
                  ShimmerContainer(height: 120, width: double.maxFinite),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(height: 14, width: 120),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(height: 15, width: 120),
                      ShimmerContainer(height: 15, width: 120),
                    ],
                  ),
                  SizedBox(height: 8),
                  ShimmerContainer(height: 28, width: double.maxFinite),
                  SizedBox(height: 20),
                  ShimmerContainer(height: 43, width: double.maxFinite),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
