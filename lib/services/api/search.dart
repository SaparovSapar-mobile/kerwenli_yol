import 'dart:convert';
import 'dart:io';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:http/http.dart' as http;

class SearchApiService {
  // fetch search ===========
  Future<SearchModel> fetchSearch(String q) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/search',
    ).replace(queryParameters: {'p': '1', 'l': '1000000', 'q': q});

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        final dynamic data = jsonData;

        if (data != null) {
          return SearchModel.fromJson(data);
        }

        return SearchModel.defaultValue();
      }
      return SearchModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }

  // Visual Search =====================
  Future<SearchModel?> visualSearch(File file) async {
    final Uri uri = Uri.parse('$apiUrl/client/visual-search');

    // multipart isteği hazırla
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    try {
      // İsteği gönder
      final http.StreamedResponse response = await request.send();

      // Cevabı oku
      final String responseBody = await response.stream.bytesToString();

      // JSON verisini çöz
      final dynamic jsonData = json.decode(responseBody);

      // Başarılıysa sonucu dön
      if (response.statusCode == 200) {
        final dynamic data = jsonData;

        if (data != null) {
          return SearchModel.fromJson(data);
        }

        return null;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
