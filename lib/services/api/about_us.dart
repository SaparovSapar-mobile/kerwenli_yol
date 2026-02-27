import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/about_us.dart';
import 'package:http/http.dart' as http;

class AboutUsApiService {
  // fetch about us text -------------------------------------
  Future<AboutUsModel> fetchAboutUs() async {
    final Uri uri = Uri.parse('$apiUrl/client/about');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas != null) {
          final List<dynamic> data = datas as List;
          return AboutUsModel.fromJson(data.first);
        }

        return AboutUsModel.defaultValue();
      }
      return AboutUsModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}
