import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_companies_list.dart';
import 'package:kerwenli_yol/pages/leader_companies/leader_companies.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';

class HomeLeaderCompanies extends StatelessWidget {
  const HomeLeaderCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeMoreButton(
          text: 'Öňde baryjy kärhanalar',
          onTap: () =>
              goToPage(context, LeaderCompaniesPage(), AxisDirection.left),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: HomeLeaderCompaniesList(),
        ),
        AppBarBottomLine(thickness: 10),
      ],
    );
  }
}
