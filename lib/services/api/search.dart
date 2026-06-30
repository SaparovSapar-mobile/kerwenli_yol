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

    print(">>> [fetchSearch] URI: $uri");

    try {
      final http.Response response = await http.get(uri);

      print(">>> [fetchSearch] Status: ${response.statusCode}");
      print(">>> [fetchSearch] Body: ${response.body}");

      final dynamic jsonData = json.decode(response.body);
      print(
        ">>> [fetchSearch] Companies raw: ${jsonData['companies']?['data']}",
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonData;

        if (data != null) {
          print(">>> [fetchSearch] Parsed OK, returning SearchModel");
          return SearchModel.fromJson(data);
        }

        print(">>> [fetchSearch] data == null, returning defaultValue");
        return SearchModel.defaultValue();
      }

      print(">>> [fetchSearch] Non-200, returning defaultValue");
      return SearchModel.defaultValue();
    } catch (e, stack) {
      print(">>> [fetchSearch] ERROR: $e");
      print(">>> [fetchSearch] STACK: $stack");
      rethrow;
    }
  }

  // Visual Search =====================
  Future<SearchModel?> visualSearch(File file) async {
    final Uri uri = Uri.parse('$apiUrl/client/visual-search');

    print(">>> [visualSearch] URI: $uri");
    print(">>> [visualSearch] File path: ${file.path}");
    print(">>> [visualSearch] File extension: ${file.path.split('.').last}");
    print(">>> [visualSearch] File size: ${await file.length()} bytes");

    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath('image', file.path),
    ); // 'image' не 'file'

    try {
      final http.StreamedResponse response = await request.send();
      print(">>> [visualSearch] Status: ${response.statusCode}");

      final String responseBody = await response.stream.bytesToString();
      print(">>> [visualSearch] Body: $responseBody");

      final dynamic jsonData = json.decode(responseBody);

      if (response.statusCode == 200) {
        final dynamic data = jsonData['data']; // берём вложенный 'data'
        if (data != null) {
          return SearchModel.fromVisualJson(
            data,
          ); // отдельный fromJson для этой структуры
        }
        return null;
      }
      return null;
    } catch (e, stack) {
      print(">>> [visualSearch] ERROR: $e");
      print(">>> [visualSearch] STACK: $stack");
      rethrow;
    }
  }
}
