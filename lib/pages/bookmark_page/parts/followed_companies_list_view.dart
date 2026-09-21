import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/companies_page/parts/company_card/parts/company_list_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/helpers/functions/search_match.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/bookmark_companies_list_view.dart';
import 'package:kerwenli_yol/providers/api/company.dart';
import 'package:kerwenli_yol/providers/pages/bookmarks_page.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/services/api/company.dart';

CompanyModel _toCompanyModel(FollowedCompanyModel c) {
  final TranslationModel p = c.publicationLabel;

  return CompanyModel(
    viewsCount: 0,
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
    workingTime: c.workingTimes
        .map(
          (wt) => {
            'day': {'tm': wt.day.tm, 'ru': wt.day.ru, 'en': wt.day.en},
            'open': wt.open,
            'close': wt.close,
          },
        )
        .toList(),
    averageRating: c.averageRating,
  );
}

class FollowedCompaniesListView extends ConsumerWidget {
  const FollowedCompaniesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String query = ref.watch(bookmarkSearchProvider);
    if (query.trim().isNotEmpty) {
      return _SearchResults(query: query);
    }

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
              return CompanyListCard(company: _toCompanyModel(c));
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

/// Отфильтрованные подписки. Грузим одной страницей и отбираем локально -
/// сервер поиска по подпискам не умеет.
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

    final AsyncValue<List<FollowedCompanyModel>> resultApi = ref.watch(
      fetchFollowedCompaniesProvider(arg),
    );

    return resultApi.when(
      loading: () => loadWidget,
      error: (error, stackTrace) =>
          SomeError(ref: ref, apiProviders: [fetchFollowedCompaniesProvider]),
      data: (companies) {
        final List<FollowedCompanyModel> found = companies
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
          itemBuilder: (context, index) =>
              CompanyListCard(company: _toCompanyModel(found[index])),
        );
      },
    );
  }
}
