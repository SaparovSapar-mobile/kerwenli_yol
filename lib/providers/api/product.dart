import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/new_product.dart';
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
