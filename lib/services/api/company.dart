import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';

class CompanyApiService {
  // fetch best companies -----------------------------
  Future<List<CompanyModel>> fetchBestCompanies(String userId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/best-companies',
    ).replace(queryParameters: {'user_uuid': userId});

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
  Future<List<CompanyModel>> fetchTravels(String userId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/travel360',
    ).replace(queryParameters: {'user_uuid': userId});

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
  Future<List<CompanyDetailModel>> fetchBookmarkedCompanies(
    CompanyParams arg,
  ) async {
    final Uri uri = Uri.parse('$apiUrl/client/bookmarks/${arg.userId}').replace(
      queryParameters: {'p': arg.page.toString(), 'l': arg.pageSize.toString()},
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
            .map<CompanyDetailModel>(
              (propJson) => CompanyDetailModel.fromJson(propJson),
            )
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch company detail by id ---------------------------------
  Future<CompanyDetailModel> fetchCompany(String id, String userId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/individuals/$id',
    ).replace(queryParameters: {'user_uuid': userId});

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

  // fetch companies by category id ---------------------------------
  Future<List<CompanyDetailModel>> fetchCompaniesByCategoryId(
    CompanyParams arg,
  ) async {
    final Uri uri =
        Uri.parse(
          '$apiUrl/client/individuals/by-category/${arg.categoryId}',
        ).replace(
          queryParameters: {
            'p': arg.page.toString(),
            'l': arg.pageSize.toString(),
            'user_uuid': arg.userId,
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
            .map<CompanyDetailModel>(
              (propJson) => CompanyDetailModel.fromJson(propJson),
            )
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch vip companies ---------------------------------
  Future<List<CompanyModel>> fetchVipCompanies(String userId) async {
    final Uri uri = Uri.parse(
      '$apiUrl/client/vip-companies',
    ).replace(queryParameters: {'user_uuid': userId});

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
  final String userId, categoryId;

  const CompanyParams({
    required this.page,
    required this.pageSize,
    required this.userId,
    required this.categoryId,
  });

  CompanyParams copyWith({
    int? page,
    int? pageSize,
    String? userId,
    String? categoryId,
  }) {
    return CompanyParams(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  List<Object?> get props => [page, pageSize, userId, categoryId];
}
