import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/gratitude.dart';

class GratitudeApiService {
  // fetch gratitudes ===========
  Future<List<GratitudeModel>> fetchGradtitudes(DefaultParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/gratitudes').replace(
      queryParameters: {'p': arg.page.toString(), 'l': arg.pageSize.toString()},
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        final dynamic datas = jsonData;
        if (datas == []) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<GratitudeModel>(
              (propJson) => GratitudeModel.fromJson(propJson),
            )
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch gratitude detail by id ---------------------------------
  Future<GratitudeModel> fetchGratitudeDetail(String id) async {
    final Uri uri = Uri.parse('$apiUrl/client/gratitudes/$id');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        final dynamic data = jsonData;

        if (data != null) {
          return GratitudeModel.fromJson(data);
        }

        return GratitudeModel.defaultValue();
      }
      return GratitudeModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}
