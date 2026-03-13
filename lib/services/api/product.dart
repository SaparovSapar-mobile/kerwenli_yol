import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/product.dart';

class ProductApiService {
  // fetch new products -----------------------------
  Future<List<NewProductModel>> fetchNewProducts() async {
    final Uri uri = Uri.parse('$apiUrl/client/new-products');

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

  // fetch company products -----------------------------
  Future<List<ProductModel>> fetchCompanyProducts(ProductParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/products/company').replace(
      queryParameters: {
        'p': arg.page.toString(),
        'l': arg.pageSize.toString(),
        'uuid': arg.companyId,
      },
    );

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
            .map<ProductModel>((propJson) => ProductModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class ProductParams extends Equatable {
  final int page, pageSize;
  final String companyId;

  const ProductParams({
    required this.page,
    required this.pageSize,
    required this.companyId,
  });

  @override
  List<Object?> get props => [page, pageSize, companyId];
}
