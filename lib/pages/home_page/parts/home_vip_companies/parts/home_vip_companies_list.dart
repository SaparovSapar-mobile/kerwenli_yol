import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_vip_companies_shimmer/home_vip_companies_shimmer.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/home_vip_company_card.dart';
import 'package:kerwenli_yol/providers/api/company.dart';

class HomeVipCompaniesList extends ConsumerWidget {
  const HomeVipCompaniesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<CompanyModel>> resultApi = ref.watch(
      fetchVipCompaniesProvider,
    );

    return SizedBox(
      height: 202,
      child: resultApi.when(
        data: (data) {
          if (data.isEmpty) {
            return Text('No data');
          }

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HomeVipCompanyCard(
              isFirst: index == 0,
              isLast: index == 9,
              cardTopTypes: [CardTopTextType.vip],
            ),
            separatorBuilder: (context, index) => SizedBox(width: 5),
            itemCount: data.length,
          );
        },
        error: (_, _) => const SizedBox.shrink(),
        loading: () => HomeVipCompaniesShimmer(),
      ),
    );
  }
}
