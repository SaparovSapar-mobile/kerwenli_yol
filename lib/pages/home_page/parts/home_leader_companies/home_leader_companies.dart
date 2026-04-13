import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_companies_list.dart';
import 'package:kerwenli_yol/pages/leader_companies/leader_companies.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_best_companies_shimmer/home_best_companies_shimmer.dart';
import 'package:kerwenli_yol/providers/api/company.dart';

class HomeLeaderCompanies extends ConsumerWidget {
  const HomeLeaderCompanies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final AsyncValue<List<CompanyModel>> resultApi = ref.watch(
      fetchBestCompaniesProvider,
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
              text: lang.leadingCompanies,
              onTap: () => goToPage(
                context,
                LeaderCompaniesPage(companies: data),
                AxisDirection.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: HomeLeaderCompaniesList(companies: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeBestCompaniesShimmer(),
    );
  }
}
