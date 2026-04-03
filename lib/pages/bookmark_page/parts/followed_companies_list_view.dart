import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_list_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/services/api/company.dart';

class FollowedCompaniesListView extends ConsumerWidget {
  const FollowedCompaniesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasFCompaniesProvider);
    final bool loading = ref.watch(loadFCompaniesProvider);
    final bool hasErr = ref.watch(hasErrFCompaniesProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult();
    } else if (!hasErr) {
      returnWidget = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final CompanyParams arg = CompanyParams(
            page: page,
            pageSize: pageSize,
            userId: '',
            categoryId: '',
          );
          final AsyncValue<List<FollowedCompanyModel>> resultApi = ref.watch(
            fetchFollowedCompaniesProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final FollowedCompanyModel c = response[indexInPage];
              final TranslationModel p = c.publicationLabel;
              final CompanyModel company = CompanyModel(
                uuid: '',
                individualUuid: c.id,
                photo: c.logoImg,
                nameTm: c.businessName.tm,
                nameRu: c.businessName.ru,
                nameEn: c.businessName.en,
                isBookmarked: false,
                isFollowed: false,
                categoryName: c.categoryName,
                publicationLabelTm: p.tm,
                publicationLabelRu: p.ru,
                publicationLabelEn: p.en,
              );
              return CompanyListCard(company: company);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadFCompaniesProvider.notifier).state = true,
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
        apiProviders: [fetchFollowedCompaniesProvider],
      );
    }

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}
