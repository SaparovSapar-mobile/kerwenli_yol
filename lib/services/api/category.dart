import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  // fetch categories ---------------------------------------------
  Future<List<CategoryModel>> fetchCategories() async {
    final Uri uri = Uri.parse('$apiUrl/client/categories');

    try {
      // debugPrint('REQUEST URL: $uri');

      final http.Response response = await http.get(uri);

      // debugPrint('STATUS CODE: ${response.statusCode}');
      // debugPrint('RESPONSE BODY: ${response.body}');

      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];


        if (datas == null || (datas is List && datas.isEmpty)) {
          // debugPrint('NO DATA FOUND');
          return [];
        }

        final List<dynamic> data = datas as List;

        // debugPrint('CATEGORY COUNT: ${data.length}');

        return data
            .map<CategoryModel>(
              (propJson) => CategoryModel.fromJson(propJson),
            )
            .toList();
      }

      // debugPrint('REQUEST FAILED');
      return [];
    } catch (e, stackTrace) {
      // debugPrint('ERROR: $e');
      // debugPrint('STACKTRACE: $stackTrace');
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
      // debugPrint('REQUEST URL: $uri');

      final http.Response response = await http.get(uri);

      // debugPrint('STATUS CODE: ${response.statusCode}');
      // debugPrint('RESPONSE BODY: ${response.body}');

      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];


        if (datas == null || (datas is List && datas.isEmpty)) {
          // debugPrint('NO DATA FOUND');
          return [];
        }

        final List<dynamic> data = datas as List;

        // debugPrint('CATEGORY COUNT: ${data.length}');

        return data
            .map<CategoryModel>(
              (propJson) => CategoryModel.fromJson(propJson),
            )
            .toList();
      }

      // debugPrint('REQUEST FAILED');
      return [];
    } catch (e, stackTrace) {
      // debugPrint('ERROR: $e');
      // debugPrint('STACKTRACE: $stackTrace');
      rethrow;
    }
  }
}