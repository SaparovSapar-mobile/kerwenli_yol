import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/notifications_page/parts/notifications_tab.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/categories_header/parts/head_category_buttons.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_companies.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_news.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_products.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/api/news.dart';
import 'package:kerwenli_yol/providers/api/product.dart';

/// Страница "Bildirişler" - открывается по колокольчику на главной.
///
/// Четыре вкладки это не фильтр уведомлений по типу (у сервера такого поля
/// нет), а четыре раздела: личные уведомления, кärhanalar, önümler и habarlar.
/// Первая вкладка идёт в /client/notifications, остальные переиспользуют
/// готовые списки и карточки из поиска.
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final List<String> tabs = notificationTabs(context);

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: homePageAppBar(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BackLeadingButton(text: lang.notifications),
            ),
            AppBarBottomLine(thickness: 2),
            HeadCategoryButtons(categories: tabs),
            AppBarBottomLine(thickness: 10),
            const SizedBox(height: 5),
            const Expanded(
              child: TabBarView(
                children: [
                  NotificationsTab(),
                  _CompaniesTab(),
                  _ProductsTab(),
                  _NewsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompaniesTab extends ConsumerWidget {
  const _CompaniesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<CompanyModel>> result = ref.watch(
      fetchVipCompaniesProvider,
    );

    return result.when(
      loading: () => loadWidget,
      error: (_, _) => NoResult(),
      data: (companies) => SearchCompanies(companies: companies),
    );
  }
}

class _ProductsTab extends ConsumerWidget {
  const _ProductsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<ProductModel>> result = ref.watch(
      fetchAllProductsProvider,
    );

    return result.when(
      loading: () => loadWidget,
      error: (_, _) => NoResult(),
      data: (products) => SearchProducts(products: products),
    );
  }
}

class _NewsTab extends ConsumerWidget {
  const _NewsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<NewsModel>> result = ref.watch(
      fetchNewsProvider(const DefaultParams()),
    );

    return result.when(
      loading: () => loadWidget,
      error: (_, _) => NoResult(),
      data: (news) => SearchNews(news: news),
    );
  }
}
