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

    print('=================================================');
    print('uri: $uri');

    try {
      final http.Response response = await http.get(uri);
      print('response.statusCode: ${response.statusCode}');
      print('response.body: ${response.body}');
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];
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
      print('error: ${e.toString()}');
      rethrow;
    }
  }
}
