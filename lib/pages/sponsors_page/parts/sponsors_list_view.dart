import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/sponsor.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_partners/parts/home_partner_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/sponsor.dart';
import 'package:kerwenli_yol/providers/pages/sponsors_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class SponsorsListView extends ConsumerWidget {
  const SponsorsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final bool hasData = ref.watch(hasSponsorsProvider);
    final bool loading = ref.watch(loadSponsorsProvider);
    final bool hasErr = ref.watch(hasErrSponsorsProvider);

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
          final AsyncValue<List<SponsorModel>> resultApi = ref.watch(
            fetchSponsorsProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final SponsorModel sponsor = response[indexInPage];
              return HomePartnerCard(sponsor: sponsor, forListView: true);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadSponsorsProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = SomeError(ref: ref, apiProviders: [fetchSponsorsProvider]);
    }

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(children: [returnWidget, if (loading) loadWidget]),
    );
  }
}
