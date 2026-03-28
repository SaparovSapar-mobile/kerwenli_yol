import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/privacy_policy.dart';

class PrivacyPolicyApiService {
  // fetch privacy policy -------------------------------------
  Future<PrivacyPolicyModel?> fetchPrivacyPolicy() async {
    final Uri uri = Uri.parse('$apiUrl/admin/privacy');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas != null) {
          final List<dynamic> data = datas as List;
          return PrivacyPolicyModel.fromJson(data.first);
        }

        return null;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
