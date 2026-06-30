import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

import '../../companies_page/parts/search_card/search_card.dart';

class SearchCompanies extends StatelessWidget {
  const SearchCompanies({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    final bool hasData = companies.isNotEmpty;

    if (hasData) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: companyCardHeight2,
        ),
        itemCount: companies.length,
        itemBuilder: (context, index) => SearchCompanyCard(company: companies[index]),
      );
    } else {
      return NoResult();
    }
  }
}
