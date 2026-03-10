import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_company_card.dart';

class HomeLeaderCompaniesList extends ConsumerWidget {
  const HomeLeaderCompaniesList({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: homeBestCompaniesCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final CompanyModel company = companies[index];
          final String name = translateText(
            ref,
            company.nameTm,
            company.nameRu,
            company.nameEn,
          );

          return HomeLeaderCompanyCard(
            isFirst: index == 0,
            isLast: index == companies.length - 1,
            name: name,
            companyId: company.individualUuid,
            image: company.photo,
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: companies.length,
      ),
    );
  }
}
