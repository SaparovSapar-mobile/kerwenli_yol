import 'dart:convert';

import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/add_p_favorite.dart';
import 'package:http/http.dart' as http;

class FavoritesApiService {
  // add or remove product like =======
  Future<bool> addProductFavorite(AddPFavoriteModel favorite) async {
    final Uri uri = Uri.parse('$apiUrl/client/likes');

    try {
      final http.Response response = await http.post(
        uri,
        body: json.encode(favorite.toJson()),
      );
      final dynamic jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }
}
