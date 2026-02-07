import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/company_card.dart';

class VipCompaniesGridView extends StatelessWidget {
  const VipCompaniesGridView({super.key, required this.vipCompanies});

  final List<CompanyModel> vipCompanies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: companyCardHeight,
      ),
      itemBuilder: (context, index) =>
          CompanyCard(company: vipCompanies[index]),
      itemCount: vipCompanies.length,
    );
  }
}
