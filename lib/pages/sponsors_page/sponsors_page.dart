import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/sponsors_page/parts/sponsors_list_view.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InternetStatusBar(),
          HeaderCompanies(text: lang.ourPartners, leftPadding: 0),
          Expanded(child: SponsorsListView()),
        ],
      ),
    );
  }
}
