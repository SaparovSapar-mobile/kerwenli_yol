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
      final bool ok = response.statusCode >= 200 && response.statusCode < 300;
      if (!ok) return AboutUsModel.defaultValue();

      final dynamic jsonData = json.decode(response.body);
      if (jsonData is! Map || jsonData['status'] != true) {
        return AboutUsModel.defaultValue();
      }

      final dynamic datas = jsonData['data'];
      if (datas is List && datas.isNotEmpty && datas.first is Map) {
        return AboutUsModel.fromJson(
          Map<String, dynamic>.from(datas.first as Map),
        );
      }
      // на случай, если сервер начнёт отдавать объект вместо списка
      if (datas is Map) {
        return AboutUsModel.fromJson(Map<String, dynamic>.from(datas));
      }

      return AboutUsModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}
