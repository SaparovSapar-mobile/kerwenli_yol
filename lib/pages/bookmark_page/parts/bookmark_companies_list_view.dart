import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/search_match.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_list_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/pages/bookmarks_page.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/services/api/company.dart';

/// Поиск фильтрует локально, поэтому берём все закладки одним запросом.
/// Закладок у пользователя единицы-десятки, не тысячи.
const int bookmarkSearchPageSize = 100;

CompanyModel _toCompanyModel(CompanyDetailModel c) {
  return CompanyModel(
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
}

class BookmarkCompaniesListView extends ConsumerWidget {
  const BookmarkCompaniesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String query = ref.watch(bookmarkSearchProvider);
    if (query.trim().isNotEmpty) {
      return _SearchResults(query: query);
    }

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
      error: (error, stackTrace) =>
          SomeError(ref: ref, apiProviders: [fetchBookmarkedCompaniesProvider]),
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
                return CompanyListCard(
                  company: _toCompanyModel(c),
                  forBookMark: true,
                );
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

/// Отфильтрованные закладки. Грузим одной страницей и отбираем локально -
/// сервер поиска по закладкам не умеет.
class _SearchResults extends ConsumerWidget {
  const _SearchResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CompanyParams arg = CompanyParams(
      page: 1,
      pageSize: bookmarkSearchPageSize,
      userId: '',
      categoryId: '',
    );

    final AsyncValue<List<CompanyDetailModel>> resultApi = ref.watch(
      fetchBookmarkedCompaniesProvider(arg),
    );

    return resultApi.when(
      loading: () => loadWidget,
      error: (error, stackTrace) =>
          SomeError(ref: ref, apiProviders: [fetchBookmarkedCompaniesProvider]),
      data: (companies) {
        final List<CompanyDetailModel> found = companies
            .where(
              (c) => matchesSearchQuery(query, [
                c.businessName.tm,
                c.businessName.ru,
                c.businessName.en,
              ]),
            )
            .toList();

        if (found.isEmpty) return NoResult();

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: found.length,
          itemBuilder: (context, index) => CompanyListCard(
            company: _toCompanyModel(found[index]),
            forBookMark: true,
          ),
        );
      },
    );
  }
}
