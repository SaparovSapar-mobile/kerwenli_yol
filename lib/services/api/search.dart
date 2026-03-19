import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/search.dart';
import 'package:http/http.dart' as http;

class SearchApiService {
  // fetch search ===========
  Future<List<SearchModel>> fetchSearch(SearchParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/search').replace(
      queryParameters: {
        'p': arg.page.toString(),
        'l': arg.pageSize.toString(),
        'q': arg.q,
      },
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];
        if (datas == []) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<SearchModel>((propJson) => SearchModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class SearchParams extends Equatable {
  final int page, pageSize;
  final String q;

  const SearchParams({
    required this.page,
    required this.pageSize,
    required this.q,
  });

  @override
  List<Object?> get props => [page, pageSize, q];
}
