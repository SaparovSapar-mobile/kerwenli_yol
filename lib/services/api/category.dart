import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  // fetch categories ---------------------------------------------
  Future<List<CategoryModel>> fetchCategories() async {
    final Uri uri = Uri.parse('$apiUrl/client/categories');

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
            .map<CategoryModel>((propJson) => CategoryModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch categories by company id -----------------------------------------
  Future<List<CategoryModel>> fetchCategoriesByCompanyId(
    String companyId,
  ) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/categories/individual/$companyId',
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
            .map<CategoryModel>((propJson) => CategoryModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
