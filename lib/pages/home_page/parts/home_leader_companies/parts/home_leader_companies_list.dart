import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_company_card.dart';

class HomeLeaderCompaniesList extends StatelessWidget {
  const HomeLeaderCompaniesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            HomeLeaderCompanyCard(isFirst: index == 0, isLast: index == 9),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
