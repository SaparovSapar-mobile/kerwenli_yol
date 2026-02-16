import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/leader_companies/parts/leader_company_card.dart';

class LeaderCompaniesGridView extends StatelessWidget {
  const LeaderCompaniesGridView({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: companies.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: leaderCompanyCardHeight,
      ),
      itemBuilder: (context, index) => LeaderCompanyCard(),
    );
  }
}
