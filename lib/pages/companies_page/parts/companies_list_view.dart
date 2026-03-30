import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_list_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/services/api/company.dart';

class CompaniesListView extends ConsumerWidget {
  const CompaniesListView({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasCompaniesProvider);
    final bool loading = ref.watch(loadCompaniesProvider);
    final bool hasErr = ref.watch(hasErrCompaniesProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult();
    } else if (!hasErr) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final CompanyParams arg = CompanyParams(
            page: page,
            pageSize: pageSize,
            categoryId: categoryId,
            userId: '',
          );
          final AsyncValue<List<CompanyDetailModel>> resultApi = ref.watch(
            fetchCompaniesByCategoryIdProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final CompanyDetailModel c = response[indexInPage];
              final CompanyModel company = CompanyModel(
                uuid: '',
                individualUuid: c.id,
                photo: c.mainInfo.logoImg,
                nameTm: c.businessName.tm,
                nameRu: c.businessName.ru,
                nameEn: c.businessName.en,
                isBookmarked: c.isBookmarked,
                isFollowed: c.isFollowed,
                categoryName: c.categoryName,
              );
              return CompanyListCard(company: company);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadCompaniesProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = SomeError(
        ref: ref,
        apiProviders: [fetchCompaniesByCategoryIdProvider],
      );
    }

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}
