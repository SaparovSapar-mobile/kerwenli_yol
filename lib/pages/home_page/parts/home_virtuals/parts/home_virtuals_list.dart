import 'package:flutter/material.dart';
import 'package:kerwenli_yol/enums/card_top_text_type.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_vip_companies/parts/home_vip_company_card/home_vip_company_card.dart';

class HomeVirtualsList extends StatelessWidget {
  const HomeVirtualsList({super.key, required this.vipCompanies});

  final List<CompanyModel> vipCompanies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vipCompanyCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HomeVipCompanyCard(
          isFirst: index == 0,
          isLast: index == vipCompanies.length - 1,
          cardTopTypes: [CardTopTextType.virtual, CardTopTextType.export],
          company: vipCompanies[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: vipCompanies.length,
      ),
    );
  }
}
