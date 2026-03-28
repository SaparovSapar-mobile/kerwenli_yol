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
        final dynamic data = jsonData['data'];

        if (data != null) {
          return PrivacyPolicyModel.fromJson(data);
        }

        return null;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
