import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/product.dart';

class ProductApiService {
  // fetch new products -----------------------------
  Future<List<NewProductModel>> fetchNewProducts(String userId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/new-products',
    ).replace(queryParameters: {'user_uuid': userId});

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas == []) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<NewProductModel>(
              (propJson) => NewProductModel.fromJson(propJson),
            )
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch all products -----------------------------
  /// GET /client/products - полный список товаров, как на сайте.
  /// Раньше главная брала /client/new-products, но там лежат рекламные
  /// кампании со сроком действия, а не товары: на сервере их всего 4 штуки,
  /// все с истёкшим end_date, поэтому список на главной был почти пустой.
  /// Без p/l сервер отдаёт только первые 20, поэтому просим явно.
  Future<List<ProductModel>> fetchAllProducts({
    required String userId,
    int page = 1,
    int pageSize = 100,
  }) async {
    final Uri uri = Uri.parse('$apiUrl/client/products').replace(
      queryParameters: {
        'p': page.toString(),
        'l': pageSize.toString(),
        'user_uuid': userId,
      },
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status'] == true) {
        final dynamic datas = jsonData['data'];

        if (datas == null || datas is! List) {
          return [];
        }

        return datas
            .map<ProductModel>((propJson) => ProductModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch company products -----------------------------
  Future<List<ProductModel>> fetchLikedProducts(ProductParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/likes/${arg.userId}').replace(
      queryParameters: {'p': arg.page.toString(), 'l': arg.pageSize.toString()},
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas == [] || datas == null) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<ProductModel>((propJson) => ProductModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch company products -----------------------------
  Future<List<ProductModel>> fetchCompanyProducts(ProductParams arg) async {
    final Uri uri =
        Uri.parse('$apiUrl/client/products/company/${arg.companyId}').replace(
          queryParameters: {
            'p': arg.page.toString(),
            'l': arg.pageSize.toString(),
            'user_uuid': arg.userId,
          },
        );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas == [] || datas == null) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<ProductModel>((propJson) => ProductModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch product detail by id ---------------------------------
  Future<ProductModel> fetchProduct(String id, String userId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/products/$id',
    ).replace(queryParameters: {'user_uuid': userId});

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic data = jsonData['data'];

        if (data != null) {
          return ProductModel.fromJson(data);
        }

        return ProductModel.defaultValue();
      }
      return ProductModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}

class ProductParams extends Equatable {
  final int page, pageSize;
  final String companyId, userId;

  const ProductParams({
    required this.page,
    required this.pageSize,
    required this.companyId,
    required this.userId,
  });

  ProductParams copyWith({
    int? page,
    int? pageSize,
    String? companyId,
    String? userId,
  }) {
    return ProductParams(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      companyId: companyId ?? this.companyId,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [page, pageSize, companyId, userId];
}
