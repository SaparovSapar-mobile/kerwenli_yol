import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/company_page_info.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_medias/company_page_medias.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_products_or_services/company_page_products_or_services.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_tabbar.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/company_page_shimmer.dart';
import 'package:kerwenli_yol/providers/api/company.dart';

class CompanyPage extends ConsumerWidget {
  const CompanyPage({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CompanyDetailModel> resultApi = ref.watch(
      fetchCompanyProvider(companyId),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homePageAppBar(context),
      body: resultApi.when(
        data: (data) {
          if (data.id == '') {
            return Center(child: Text('No data'));
          }

          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                InternetStatusBar(),
                // ========= Fixed ===========
                CompanyPageTop(
                  text: 'Karhana',
                  showBottomLine: true,
                  onPressed: () => showCompanyPageMessageBottomSheet(context),
                  leftPadding: 0,
                ),
                CompanyPageTabbar(),

                // ========= Scroll ===========
                Expanded(
                  child: NestedScrollView(
                    // ========= Scroll Header ===========
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      CompanyPageCard(company: data),
                    ],
                    // ========= Scroll Body ===========
                    body: TabBarView(
                      children: [
                        CompanyPageInfo(company: data),
                        CompanyPageProductsOrServices(companyId: companyId),
                        CompanyPageMedias(companyId: companyId),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (_, _) => const SizedBox.shrink(),
        loading: () => CompanyPageShimmer(),
      ),
    );
  }
}
