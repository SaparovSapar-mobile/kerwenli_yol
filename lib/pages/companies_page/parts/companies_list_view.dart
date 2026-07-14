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
    final CompanyParams firstArg = CompanyParams(
      page: 1,
      pageSize: pageSize,
      categoryId: categoryId,
      userId: '',
    );

    final AsyncValue<List<CompanyDetailModel>> firstPage = ref.watch(
      fetchCompaniesByCategoryIdProvider(firstArg),
    );

    return firstPage.when(
      loading: () => loadWidget,
      error: (error, stackTrace) => SomeError(
        ref: ref,
        apiProviders: [fetchCompaniesByCategoryIdProvider],
      ),
      data: (firstData) {
        if (firstData.isEmpty) return NoResult();

        final bool hasErr = ref.watch(hasErrCompaniesProvider);
        if (hasErr) {
          return SomeError(
            ref: ref,
            apiProviders: [fetchCompaniesByCategoryIdProvider],
          );
        }

        final int totalItems = firstData.length;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: totalItems,
          itemBuilder: (context, index) {
            final int page = index ~/ pageSize + 1;
            final int indexInPage = index % pageSize;

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
                if (indexInPage >= response.length) return null;

                final CompanyDetailModel c = response[indexInPage];
                final CompanyModel company = CompanyModel(
                  viewsCount: c.viewsCount,
                  uuid: '',
                  individualUuid: c.id,
                  photo: c.mainInfo.logoImg,
                  nameTm: c.businessName.tm,
                  nameRu: c.businessName.ru,
                  nameEn: c.businessName.en,
                  isBookmarked: c.isBookmarked,
                  isFollowed: c.isFollowed,
                  categoryName: c.categoryName,
                  publicationLabelTm: '',
                  publicationLabelRu: '',
                  publicationLabelEn: '',
                  workingTime: c.workingTimes
                      .map(
                        (wt) => {
                          'day': {
                            'tm': wt.day.tm,
                            'ru': wt.day.ru,
                            'en': wt.day.en,
                          },
                          'open': wt.open,
                          'close': wt.close,
                        },
                      )
                      .toList(),
                  averageRating: c.averageRating,
                );
                return CompanyListCard(company: company);
              },
              error: (error, stackTrace) => SomeError(
                ref: ref,
                apiProviders: [fetchCompaniesByCategoryIdProvider],
              ),
              loading: () => loadWidget,
            );
          },
        );
      },
    );
  }
}
