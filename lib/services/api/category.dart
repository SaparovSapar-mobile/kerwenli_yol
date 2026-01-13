import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  // fetch categories ------------------------------------------------------------
  Future<List<CategoryModel>> fetchCategories() async {
    Uri uri = Uri.parse('$apiUrl/client/categories');

    try {
      http.Response response = await http.get(uri);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        var datas = jsonData['data'];
        if (datas == []) {
          return [];
        }

        var data = datas as List;
        return data
            .map<CategoryModel>((propJson) => CategoryModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
