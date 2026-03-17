import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';

class CompanyApiService {
  // fetch best companies -----------------------------
  Future<List<CompanyModel>> fetchBestCompanies() async {
    final Uri uri = Uri.parse('$apiUrl/client/best-companies');

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
            .map<CompanyModel>((propJson) => CompanyModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch travel 360 ---------------------------------
  Future<List<CompanyModel>> fetchTravels() async {
    final Uri uri = Uri.parse('$apiUrl/client/travel360');

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
            .map<CompanyModel>((propJson) => CompanyModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch bookmarked companies -------------------------
  Future<List<CompanyModel>> fetchBookmarkedCompanies(CompanyParams arg) async {
    final Uri uri = Uri.parse('$apiUrl/client/bookmarks/${arg.userId}').replace(
      queryParameters: {'p': arg.page.toString(), 'l': arg.pageSize.toString()},
    );
    print('==================================== fetchBookmarkedCompanies');
    print('uri: $uri');

    try {
      final http.Response response = await http.get(uri);
      print('response.statusCode: ${response.statusCode}');
      print('response.body: ${response.body}');
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas == []) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<CompanyModel>((propJson) => CompanyModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      print('error: ${e.toString()}');
      rethrow;
    }
  }

  // fetch company detail by id ---------------------------------
  Future<CompanyDetailModel> fetchCompany(String id) async {
    final Uri uri = Uri.parse('$apiUrl/client/individuals/$id');

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic data = jsonData['data'];

        if (data != null) {
          return CompanyDetailModel.fromJson(data);
        }

        return CompanyDetailModel.defaultValue();
      }
      return CompanyDetailModel.defaultValue();
    } catch (e) {
      rethrow;
    }
  }

  // fetch vip companies ---------------------------------
  Future<List<CompanyModel>> fetchVipCompanies() async {
    final Uri uri = Uri.parse('$apiUrl/client/vip-companies');

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
            .map<CompanyModel>((propJson) => CompanyModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

class CompanyParams extends Equatable {
  final int page, pageSize;
  final String userId;

  const CompanyParams({
    required this.page,
    required this.pageSize,
    required this.userId,
  });

  CompanyParams copyWith({int? page, int? pageSize, String? userId}) {
    return CompanyParams(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [page, pageSize, userId];
}
