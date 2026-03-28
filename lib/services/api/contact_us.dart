import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/contact_us.dart';

class ContactUsApiService {
  // fetch about us text -------------------------------------
  Future<ContactUsModel?> fetchContactUs() async {
    final Uri uri = Uri.parse('$apiUrl/client/footer');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic data = jsonData['data'];

        if (data != null) {
          return ContactUsModel.fromJson(data);
        }

        return null;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
