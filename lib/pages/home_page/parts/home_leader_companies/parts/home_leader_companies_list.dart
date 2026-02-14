import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_company_card.dart';

class HomeLeaderCompaniesList extends StatelessWidget {
  const HomeLeaderCompaniesList({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeBestCompaniesCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeLeaderCompanyCard(
          isFirst: index == 0,
          isLast: index == 9,
          company: companies[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: companies.length,
      ),
    );
  }
}
