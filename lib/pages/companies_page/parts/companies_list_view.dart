import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_list_card.dart';

class CompaniesListView extends StatelessWidget {
  const CompaniesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => CompanyListCard(),
      ),
    );
  }
}
