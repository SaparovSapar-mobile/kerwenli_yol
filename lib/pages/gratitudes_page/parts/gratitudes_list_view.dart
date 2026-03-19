import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/gratitude.dart';
import 'package:kerwenli_yol/pages/gratitudes_page/parts/graditute_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/gratitude.dart';
import 'package:kerwenli_yol/providers/pages/gratitudes_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class GratitudesListView extends ConsumerWidget {
  const GratitudesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final bool hasData = ref.watch(hasGratitudesProvider);
    final bool loading = ref.watch(loadGratitudesProvider);
    final bool hasErr = ref.watch(hasErrGratitudesProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult();
    } else if (!hasErr) {
      returnWidget = ListView.builder(
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final DefaultParams arg = DefaultParams(
            page: page,
            pageSize: pageSize,
          );
          final AsyncValue<List<GratitudeModel>> resultApi = ref.watch(
            fetchGradtitudesProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final GratitudeModel gratitude = response[indexInPage];
              return GradituteCard(gratitude: gratitude);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadGratitudesProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = SomeError(
        ref: ref,
        apiProviders: [fetchGradtitudesProvider],
      );
    }

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(children: [returnWidget, if (loading) loadWidget]),
    );
  }
}
