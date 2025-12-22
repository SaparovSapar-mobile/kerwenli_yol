import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_company_card.dart';

class CompanyInfoBrandsList extends StatelessWidget {
  const CompanyInfoBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 71,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeLeaderCompanyCard(),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
