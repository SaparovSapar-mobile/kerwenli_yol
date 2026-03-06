import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/news_model.dart';

class NewsApiService {
  // fetch news ===========
  Future<List<NewsModel>> fetchNews(DefaultParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/news').replace(
      queryParameters: {'p': arg.page.toString(), 'l': arg.pageSize.toString()},
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
            .map<NewsModel>((propJson) => NewsModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch news detail by id ---------------------------------
  Future<NewsModel> fetchNewsDetail(String id) async {
    final Uri uri = Uri.parse('$apiUrl/client/news/$id');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic data = jsonData['data'];

        if (data != null) {
          return NewsModel.fromJson(data);
        }

        return NewsModel.defaultValue();
      }
      return NewsModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}
