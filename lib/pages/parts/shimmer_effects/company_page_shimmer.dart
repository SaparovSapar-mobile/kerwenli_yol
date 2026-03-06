import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/shimmer_container.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CompanyPageShimmer extends ConsumerWidget {
  const CompanyPageShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======== Colors ============
    final bool isLight = isLightTheme(context, ref);

    final double colorOpacity = isLight ? 1 : .1;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Shimmer(
          colorOpacity: colorOpacity,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ShimmerContainer(height: 49, width: double.maxFinite),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ShimmerContainer(
                      height: 43,
                      width: double.maxFinite,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ShimmerContainer(
                      height: 43,
                      width: double.maxFinite,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ShimmerContainer(
                      height: 43,
                      width: double.maxFinite,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ShimmerContainer(
                height: 102.40240478515625,
                width: double.maxFinite,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerContainer(height: 26, width: 26),
                      SizedBox(width: 5),
                      ShimmerContainer(height: 26, width: 45.160396575927734),
                    ],
                  ),
                  ShimmerContainer(height: 26, width: 100),
                ],
              ),
              SizedBox(height: 10),
              ShimmerContainer(height: 38, width: double.maxFinite),
              SizedBox(height: 10),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 5),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 10),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 10),
              ShimmerContainer(height: 25, width: double.maxFinite),
              SizedBox(height: 10),
              ShimmerContainer(height: 14, width: 74),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    height: 68.27582550048828,
                    width: 88.57925415039062,
                  ),
                  SizedBox(width: 10),
                  ShimmerContainer(
                    height: 68.27582550048828,
                    width: 88.57925415039062,
                  ),
                  SizedBox(width: 10),
                  ShimmerContainer(
                    height: 68.27582550048828,
                    width: 88.57925415039062,
                  ),
                ],
              ),
              SizedBox(height: 10),
              ShimmerContainer(height: 14, width: 74),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    height: 88.2887954711914,
                    width: 64.21002960205078,
                  ),
                  SizedBox(width: 10),
                  ShimmerContainer(
                    height: 88.2887954711914,
                    width: 64.21002960205078,
                  ),
                  SizedBox(width: 10),
                  ShimmerContainer(
                    height: 88.2887954711914,
                    width: 64.21002960205078,
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
