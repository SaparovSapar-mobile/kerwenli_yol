import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        datas = await ref.read(productApiProvider).fetchNewProducts();
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
        result = await ref.read(productApiProvider).fetchCompanyProducts(arg);
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

final AutoDisposeFutureProviderFamily<ProductModel, String>
fetchProductProvider = FutureProvider.autoDispose.family<ProductModel, String>((
  ref,
  arg,
) async {
  ProductModel result = ProductModel.defaultValue();

  try {
    result = await ref.read(productApiProvider).fetchProduct(arg);
  } catch (e) {
    rethrow;
  }
  return result;
});
