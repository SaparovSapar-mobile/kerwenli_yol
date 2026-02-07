import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_list_card.dart';

class VipCompaniesListView extends StatelessWidget {
  const VipCompaniesListView({super.key, required this.vipCompanies});

  final List<CompanyModel> vipCompanies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => CompanyListCard(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 10),
      itemCount: vipCompanies.length,
    );
  }
}
