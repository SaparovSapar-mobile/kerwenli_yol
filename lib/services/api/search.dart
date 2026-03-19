import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:http/http.dart' as http;

class SearchApiService {
  // fetch search ===========
  Future<SearchModel> fetchSearch(String q) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/search',
    ).replace(queryParameters: {'p': '1', 'l': '1000000', 'q': q});

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        final dynamic data = jsonData;

        if (data != null) {
          return SearchModel.fromJson(data);
        }

        return SearchModel.defaultValue();
      }
      return SearchModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}
