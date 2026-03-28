import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/models/contact_us.dart';

class ContactUsApiService {
  // fetch about us text -------------------------------------
  Future<ContactUsModel> fetchContactUs() async {
    final Uri uri = Uri.parse('$apiUrl/client/footer');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas != null) {
          final List<dynamic> data = datas as List;
          return ContactUsModel.fromJson(data.first);
        }

        return ContactUsModel.defaultValue();
      }
      return ContactUsModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }
}
