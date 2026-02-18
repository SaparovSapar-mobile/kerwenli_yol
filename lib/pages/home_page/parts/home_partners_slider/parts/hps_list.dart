import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/pages/example_widgets/leader_companies/exm_home_leader_company_card.dart';

class HpsList extends StatelessWidget {
  const HpsList({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: homeBestCompaniesCardHeight,
      child: ListView.separated(
        controller: scrollController,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ExmHomeLeaderCompanyCard(),
        separatorBuilder: (_, _) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
