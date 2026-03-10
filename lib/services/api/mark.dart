import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/mark.dart';
import 'package:http/http.dart' as http;

class MarkApiService {
  // fetch marks ============
  Future<List<MarkModel>> fetchMarks(String markTypeId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/marks',
    ).replace(queryParameters: {'type': markTypeId});

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
            .map<MarkModel>((propJson) => MarkModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
