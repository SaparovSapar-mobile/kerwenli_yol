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

class BookmarkCompaniesListView extends ConsumerWidget {
  const BookmarkCompaniesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CompanyParams firstArg = CompanyParams(
      page: 1,
      pageSize: pageSize,
      userId: '',
      categoryId: '',
    );

    final AsyncValue<List<CompanyDetailModel>> firstPage = ref.watch(
      fetchBookmarkedCompaniesProvider(firstArg),
    );

    return firstPage.when(
      loading: () => loadWidget,
      error: (error, stackTrace) => SomeError(
        ref: ref,
        apiProviders: [fetchBookmarkedCompaniesProvider],
      ),
      data: (firstData) {
        if (firstData.isEmpty) return NoResult();

        final bool hasErr = ref.watch(hasErrBCompaniesProvider);
        if (hasErr) {
          return SomeError(
            ref: ref,
            apiProviders: [fetchBookmarkedCompaniesProvider],
          );
        }

        final int totalItems = firstData.length;

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: totalItems,
          itemBuilder: (context, index) {
            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;

            final CompanyParams arg = CompanyParams(
              page: page,
              pageSize: pageSize,
              userId: '',
              categoryId: '',
            );
            final AsyncValue<List<CompanyDetailModel>> resultApi = ref.watch(
              fetchBookmarkedCompaniesProvider(arg),
            );

            return resultApi.when(
              data: (response) {
                if (indexInPage >= response.length) {
                  return null;
                }

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
                  averageRating: c.averageRating,
                );
                return CompanyListCard(company: company, forBookMark: true);
              },
              error: (error, stackTrace) => SomeError(
                ref: ref,
                apiProviders: [fetchBookmarkedCompaniesProvider],
              ),
              loading: () => loadWidget,
            );
          },
        );
      },
    );
  }
}
