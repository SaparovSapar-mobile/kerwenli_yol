import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/banner.dart';

class BannerApiService {
  // fetch banners ------------------------------------------------------------
  Future<List<BannerModel>> fetchBanners() async {
    final Uri uri = Uri.parse('$apiUrl/client/banners');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];
        if (datas == null || (datas is List && datas.isEmpty)) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<BannerModel>((propJson) => BannerModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e, stackTrace) {
      print('BANNER ERROR: $e');
      print('STACKTRACE: $stackTrace');
      rethrow;
    }
  }
}
