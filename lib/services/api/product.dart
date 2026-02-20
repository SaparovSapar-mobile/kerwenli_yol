import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/new_product.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  // fetch new products -----------------------------
  Future<List<NewProductModel>> fetchNewProducts() async {
    Uri uri = Uri.parse('$apiUrl/client/new-products');

    try {
      http.Response response = await http.get(uri);
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
}
