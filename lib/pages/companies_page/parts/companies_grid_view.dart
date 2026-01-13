import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/home_vip_company_card.dart';

class CompaniesGridView extends StatelessWidget {
  const CompaniesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: companyCardHeight,
        ),
        itemBuilder: (context, index) => HomeVipCompanyCard(),
      ),
    );
  }
}
