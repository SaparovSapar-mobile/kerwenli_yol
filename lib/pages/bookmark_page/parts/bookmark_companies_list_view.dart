import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/example_widgets/companies_page/parts/company_card/parts/exm_company_list_card.dart';

class BookmarkCompaniesListView extends StatelessWidget {
  const BookmarkCompaniesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => ExmCompanyListCard(forBookMark: true),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 10),
      itemCount: 12,
    );
  }
}
