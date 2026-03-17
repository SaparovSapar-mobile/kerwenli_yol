import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/enums/favorite_type.dart';
import 'package:kerwenli_yol/helpers/functions/user.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/providers/pages/products_page.dart';
import 'package:kerwenli_yol/services/api/product.dart';

final Provider<ProductApiService> productApiProvider =
    Provider<ProductApiService>((ref) => ProductApiService());

final FutureProvider<List<NewProductModel>> fetchNewProductsProvider =
    FutureProvider<List<NewProductModel>>((ref) async {
      List<NewProductModel> datas = [];

      try {
        final String userId = await getUserId();
        datas = await ref.read(productApiProvider).fetchNewProducts(userId);
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
        final String userId = await getUserId();
        ProductParams params = arg.copyWith(userId: userId);
        result = await ref
            .read(productApiProvider)
            .fetchCompanyProducts(params);

        if (arg.page == 1) {
          ref.read(hasCProductsProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrCProductsProvider.notifier).state = false;
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
fetchLikedProducts = FutureProvider.family
    .autoDispose<List<ProductModel>, ProductParams>((ref, arg) async {
      List<ProductModel> result = [];

      try {
        final String userId = await getUserId();
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
    final String userId = await getUserId();
    result = await ref.read(productApiProvider).fetchProduct(arg, userId);
  } catch (e) {
    rethrow;
  }
  return result;
});
