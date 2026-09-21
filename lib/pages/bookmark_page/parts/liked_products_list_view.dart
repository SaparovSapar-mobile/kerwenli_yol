import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/product_list_card/product_list_card.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/helpers/functions/search_match.dart';
import 'package:kerwenli_yol/pages/bookmark_page/parts/bookmark_companies_list_view.dart';
import 'package:kerwenli_yol/providers/api/product.dart';
import 'package:kerwenli_yol/providers/pages/bookmarks_page.dart';
import 'package:kerwenli_yol/providers/pages/products_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';

class LikedProductsListView extends ConsumerWidget {
  const LikedProductsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String query = ref.watch(bookmarkSearchProvider);
    if (query.trim().isNotEmpty) {
      return _SearchResults(query: query);
    }

    final bool hasData = ref.watch(hasFProductsProvider);
    final bool loading = ref.watch(loadFProductsProvider);
    final bool hasErr = ref.watch(hasErrFProductsProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult();
    } else if (!hasErr) {
      returnWidget = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final ProductParams arg = ProductParams(
            page: page,
            pageSize: pageSize,
            companyId: '',
            userId: '',
          );
          final AsyncValue<List<ProductModel>> resultApi = ref.watch(
            fetchLikedProductsProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final ProductModel product = response[indexInPage];
              return ProductListCard(product: product);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadFProductsProvider.notifier).state = true,
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
        apiProviders: [fetchLikedProductsProvider],
      );
    }

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}

/// Отфильтрованные лайки. Грузим одной страницей и отбираем локально -
/// сервер поиска по лайкам не умеет.
class _SearchResults extends ConsumerWidget {
  const _SearchResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProductParams arg = ProductParams(
      page: 1,
      pageSize: bookmarkSearchPageSize,
      companyId: '',
      userId: '',
    );

    final AsyncValue<List<ProductModel>> resultApi = ref.watch(
      fetchLikedProductsProvider(arg),
    );

    return resultApi.when(
      loading: () => loadWidget,
      error: (error, stackTrace) =>
          SomeError(ref: ref, apiProviders: [fetchLikedProductsProvider]),
      data: (products) {
        final List<ProductModel> found = products
            .where(
              (p) => matchesSearchQuery(query, [
                p.nameTm,
                p.nameRu,
                p.nameEn,
                p.companyName.tm,
                p.companyName.ru,
                p.companyName.en,
              ]),
            )
            .toList();

        if (found.isEmpty) return NoResult();

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: found.length,
          itemBuilder: (context, index) =>
              ProductListCard(product: found[index]),
        );
      },
    );
  }
}
