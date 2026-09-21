import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/enums/favorite_type.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/pages/products_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';

final Provider<ProductApiService> productApiProvider =
    Provider<ProductApiService>((ref) => ProductApiService());

final FutureProvider<List<NewProductModel>> fetchNewProductsProvider =
    FutureProvider<List<NewProductModel>>((ref) async {
      List<NewProductModel> datas = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        datas = await ref.read(productApiProvider).fetchNewProducts(userId);

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_liked we is_followed true gelse
        // like - lar local db save edilyar
        if (userId != '' && datas.isNotEmpty) {
          for (final NewProductModel e in datas) {
            final List<ProductModel> products = e.products;
            if (products.isNotEmpty) {
              for (final ProductModel product in products) {
                if (product.isLiked) {
                  final FavoriteModel bp = FavoriteModel(
                    id: product.id,
                    type: FavoriteTypeEnum.product,
                  );
                  if (!await hasInFavorites(bp)) {
                    await addOrRemoveFromFavorites(bp);
                  }
                }
              }
            }
          }
        }
      } catch (e) {
        rethrow;
      }

      return datas;
    });

/// Полный список товаров для главной страницы и страницы "Täze önümler".
/// Сортировка приходит с сервера - от новых к старым.
final FutureProvider<List<ProductModel>> fetchAllProductsProvider =
    FutureProvider<List<ProductModel>>((ref) async {
      List<ProductModel> datas = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        datas = await ref
            .read(productApiProvider)
            .fetchAllProducts(userId: userId);

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_liked we is_followed true gelse
        // like - lar local db save edilyar
        if (userId != '' && datas.isNotEmpty) {
          for (final ProductModel product in datas) {
            if (product.isLiked) {
              final FavoriteModel bp = FavoriteModel(
                id: product.id,
                type: FavoriteTypeEnum.product,
              );
              if (!await hasInFavorites(bp)) {
                await addOrRemoveFromFavorites(bp);
              }
            }
          }
        }
      } catch (e) {
        rethrow;
      }

      return datas;
    });

final FutureProviderFamily<List<ProductModel>, ProductParams>
fetchCompanyProductsProvider =
    FutureProvider.family<List<ProductModel>, ProductParams>((ref, arg) async {
      List<ProductModel> result = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        ProductParams params = arg.copyWith(userId: userId);
        result = await ref
            .read(productApiProvider)
            .fetchCompanyProducts(params);

        if (arg.page == 1) {
          ref.read(hasCProductsProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrCProductsProvider.notifier).state = false;
        }

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_liked we is_followed true gelse
        // like - lar local db save edilyar
        if (userId != '' && result.isNotEmpty) {
          for (final ProductModel product in result) {
            if (product.isLiked) {
              final FavoriteModel bp = FavoriteModel(
                id: product.id,
                type: FavoriteTypeEnum.product,
              );
              if (!await hasInFavorites(bp)) {
                await addOrRemoveFromFavorites(bp);
              }
            }
          }
        }
      } catch (e) {
        ref.read(hasErrCProductsProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadCProductsProvider.notifier).state = false;
      return result;
    });

final AutoDisposeFutureProviderFamily<List<ProductModel>, ProductParams>
fetchLikedProductsProvider = FutureProvider.family
    .autoDispose<List<ProductModel>, ProductParams>((ref, arg) async {
      List<ProductModel> result = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);

        // Без логина id пустой, и URL превращается в /client/likes/ -
        // сервер отвечает 404 обычным текстом, json.decode падает и
        // страница показывает "Näsazlyk ýüze çykdy" вместо "Maglumat ýok"
        if (userId.isEmpty) {
          if (arg.page == 1) {
            ref.read(hasFProductsProvider.notifier).state = false;
            ref.read(hasErrFProductsProvider.notifier).state = false;
          }
          ref.read(loadFProductsProvider.notifier).state = false;
          return result;
        }

        ProductParams params = arg.copyWith(userId: userId);

        result = await ref.read(productApiProvider).fetchLikedProducts(params);
        if (arg.page == 1) {
          ref.read(hasFProductsProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrFProductsProvider.notifier).state = false;
        }

        if (result.isNotEmpty) {
          for (final ProductModel product in result) {
            final FavoriteModel params = FavoriteModel(
              id: product.id,
              type: FavoriteTypeEnum.product,
            );

            if (!await hasInFavorites(params)) {
              await addOrRemoveFromFavorites(params);
            }
          }
        }
      } catch (e) {
        ref.read(hasErrFProductsProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadFProductsProvider.notifier).state = false;
      return result;
    });

final AutoDisposeFutureProviderFamily<ProductModel, String>
fetchProductProvider = FutureProvider.autoDispose.family<ProductModel, String>((
  ref,
  arg,
) async {
  ProductModel result = ProductModel.defaultValue();

  try {
    final String userId = await ref.watch(getUserIdProvider.future);
    result = await ref.read(productApiProvider).fetchProduct(arg, userId);

    // Eger user id bar bolsa we maglumat bos dal bolsa
    // we api - den is_liked we is_followed true gelse
    // like - lar local db save edilyar
    if (userId != '' && result.id != '') {
      if (result.isLiked) {
        final FavoriteModel bp = FavoriteModel(
          id: result.id,
          type: FavoriteTypeEnum.product,
        );
        if (!await hasInFavorites(bp)) {
          await addOrRemoveFromFavorites(bp);
        }
      }
    }
  } catch (e) {
    rethrow;
  }
  return result;
});
