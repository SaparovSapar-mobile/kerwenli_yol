import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/example_widgets/companies_page/parts/company_card/exm_company_card.dart';

class CompaniesGridView extends StatelessWidget {
  const CompaniesGridView({super.key});

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
      itemBuilder: (context, index) => ExmCompanyCard(),
    );
  }
}
