import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/pages/gratitudes_page/gratitudes_page.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_graditutes/parts/home_graditute_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_gratitudes_shimmer/home_gratitudes_shimmer.dart';
import 'package:kerwenli_yol/providers/api/gratitude.dart';

class HomeGraditutes extends ConsumerWidget {
  const HomeGraditutes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DefaultParams arg = DefaultParams(page: 1, pageSize: 10);
    final AsyncValue<List<GratitudeModel>> resultApi = ref.watch(
      fetchGradtitudesProvider(arg),
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeMoreButton(
              text: 'Minnetdarlyklar',
              onTap: () =>
                  goToPage(context, GratitudesPage(), AxisDirection.left),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: HomeGradituteList(gratitudes: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeGratitudesShimmer(),
    );
  }
}
