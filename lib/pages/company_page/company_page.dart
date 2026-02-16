import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_card.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/company_page_info.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_medias/company_page_medias.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_products_or_services/company_page_products_or_services.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_tabbar.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_top.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/providers/api/company.dart';

class CompanyPage extends ConsumerWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CompanyDetailModel> resultApi = ref.watch(
      fetchCompanyProvider('eb55acc9-fc8c-47c3-8fd1-0cd875a1df03'),
    );

    return resultApi.when(
      data: (data) {
        if (data.id == '') {
          return Center(child: Text('No data'));
        }

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: homePageAppBar(context),
            body: Column(
              children: [
                InternetStatusBar(),
                // ========= Fixed ===========
                CompanyPageTop(
                  text: 'VIP Karhanalar',
                  showBottomLine: true,
                  onPressed: () => showCompanyPageMessageBottomSheet(context),
                ),
                CompanyPageTabbar(),

                // ========= Scroll ===========
                Expanded(
                  child: NestedScrollView(
                    // ========= Scroll Header ===========
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      CompanyPageCard(),
                    ],
                    // ========= Scroll Body ===========
                    body: TabBarView(
                      children: [
                        CompanyPageInfo(),
                        CompanyPageProductsOrServices(),
                        CompanyPageMedias(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => loadWidget,
    );
  }
}
