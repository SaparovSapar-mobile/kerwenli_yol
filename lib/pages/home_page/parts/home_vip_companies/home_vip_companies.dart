import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_companies_list.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_vip_companies_shimmer/home_vip_companies_shimmer.dart';
import 'package:kerwenli_yol/pages/vip_companies_page/vip_companies_page.dart';
import 'package:kerwenli_yol/providers/api/company.dart';

class HomeVipCompanies extends ConsumerWidget {
  const HomeVipCompanies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final AsyncValue<List<CompanyModel>> resultApi = ref.watch(
      fetchVipCompaniesProvider,
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
              text: lang.vipCompanies,
              onTap: () => goToPage(
                context,
                VipCompaniesPage(vipCompanies: data),
                AxisDirection.left,
                name: 'vip_companies',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: HomeVipCompaniesList(vipCompanies: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeVipCompaniesShimmer(),
    );
  }
}
