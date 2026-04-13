import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/gratitudes_page/parts/gratitudes_list_view.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';

class GratitudesPage extends StatelessWidget {
  const GratitudesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InternetStatusBar(),
          HeaderCompanies(text: lang.acknowledgements, leftPadding: 0),
          Expanded(child: GratitudesListView()),
        ],
      ),
    );
  }
}
