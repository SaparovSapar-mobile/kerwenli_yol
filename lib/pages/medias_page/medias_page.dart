import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/header_companies.dart';
import 'package:kerwenli_yol/pages/medias_page/parts/medias_grid_view.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/app_refresh_indicator.dart';
import 'package:kerwenli_yol/providers/api/media.dart';
import 'package:kerwenli_yol/providers/pages/medias_page.dart';

class MediasPage extends StatelessWidget {
  const MediasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InternetStatusBar(),
          HeaderCompanies(text: 'Medialar', leftPadding: 0),
          Expanded(
            child: AppRefreshIndicator(
              providers: [
                fetchMediasProvider,
                hasMediasProvider,
                hasErrMediasProvider,
                loadMediasProvider,
              ],
              child: MediasGridView(),
            ),
          ),
        ],
      ),
    );
  }
}
