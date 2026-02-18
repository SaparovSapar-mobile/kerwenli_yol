import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_features/company_features.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_info/company_info.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_info/parts/company_page_about/company_page_about.dart';
import 'package:kerwenli_yol/pages/company_page/parts/company_page_part_tabbar.dart';

class CompanyPageInfo extends StatelessWidget {
  const CompanyPageInfo({super.key, required this.company});

  final CompanyDetailModel company;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CompanyPagePartTabbar(
            tabTexts: ['Biz Barada', 'Info', 'Mumkincilikler'],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _InnerTabScroll(child: CompanyPageAbout(company: company)),
                _InnerTabScroll(child: CompanyInfo(company: company)),
                _InnerTabScroll(child: CompanyFeatures()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InnerTabScroll extends StatelessWidget {
  const _InnerTabScroll({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: child);
  }
}
