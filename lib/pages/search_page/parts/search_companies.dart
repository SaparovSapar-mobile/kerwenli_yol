import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchCompanies extends StatelessWidget {
  const SearchCompanies({super.key, required this.companies});

  final List<CompanyModel> companies;

  @override
  Widget build(BuildContext context) {
    final bool hasData = companies.isNotEmpty;

    return hasData ? Center(child: Text('has data')) : NoResult();
  }
}
