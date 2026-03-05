import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/media.dart';

class MediaApiService {
  // fetch banners ------------------------------------------------------------
  Future<List<MediaModel>> fetchMedias(DefaultParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/media').replace(
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
            .map<MediaModel>((propJson) => MediaModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
