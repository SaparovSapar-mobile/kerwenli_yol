import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/rate_company.dart';
import 'package:kerwenli_yol/models/send_msg_to_company.dart';

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

        if (datas == [] || datas == null) {
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

  // fetch companies by category id (or by subcategory id) -----------
  Future<List<CompanyDetailModel>> fetchCompaniesByCategoryId(
    CompanyParams arg,
  ) async {
    final bool bySubCategory =
        arg.subCategoryId != null && arg.subCategoryId!.isNotEmpty;
    final String path = bySubCategory
        ? '/client/individuals/by-subcategory/${arg.subCategoryId}'
        : '/client/individuals/by-category/${arg.categoryId}';

    final Uri uri = Uri.parse('$apiUrl$path').replace(
      queryParameters: {
        'p': arg.page.toString(),
        'l': arg.pageSize.toString(),
        'user_uuid': arg.userId,
      },
    );

    try {
      debugPrint('COMPANIES REQUEST URL: $uri');
      final http.Response response = await http.get(uri);
      debugPrint('COMPANIES STATUS CODE: ${response.statusCode}');
      debugPrint('COMPANIES RESPONSE: ${response.body}');

      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        // ← ИСПРАВЛЕНИЕ: data['items'] вместо data
        final dynamic datas = jsonData['data']?['items'];

        if (datas == null || datas is! List) {
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
        final List<dynamic>? datas = jsonData['data']?['items'] as List?;

        if (datas == [] || datas == null) {
          return [];
        }

        return datas
            .map<CompanyModel>((propJson) => CompanyModel.fromJson(propJson))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // fetch bookmarked companies -------------------------
  Future<List<FollowedCompanyModel>> fetchFollowedCompanies(
    CompanyParams arg,
  ) async {
    final Uri uri = Uri.parse('$apiUrl/client/follows/${arg.userId}').replace(
      queryParameters: {'p': arg.page.toString(), 'l': arg.pageSize.toString()},
    );

    try {
      final http.Response response = await http.get(uri);
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        final dynamic datas = jsonData['data'];

        if (datas == [] || datas == null) {
          return [];
        }

        final List<dynamic> data = datas as List;
        return data
            .map<FollowedCompanyModel>(
              (propJson) => FollowedCompanyModel.fromJson(propJson),
            )
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  // send message to company =======
  Future<bool> sendMessageToCompany(SendMsgToCompanyModel msg) async {
    final Uri uri = Uri.parse('$apiUrl/client/message');

    try {
      final http.Response response = await http.post(
        uri,
        // остальные POST-запросы в проекте заголовок ставят, этот - нет
        headers: {'Content-Type': 'application/json'},
        body: json.encode(msg.toJson()),
      );
      final dynamic jsonData = json.decode(response.body);

      // сервер на создание записи отвечает 201, а не 200 - ровно на этом
      // не работал "Hat yazmak": письмо уходило, а приложение показывало
      // "Nasazlyk yuze chykdy"
      final bool ok = response.statusCode >= 200 && response.statusCode < 300;
      return ok && jsonData['status'] == true;
    } catch (e) {
      rethrow;
    }
  }

  // rate a company ---------------------------------
  Future<bool> rateCompany(RateCompanyModel data) async {
    final Uri uri = Uri.parse('$apiUrl/client/rate');

    try {
      final http.Response response = await http.post(
        uri,
        body: json.encode(data.toJson()),
      );
      final dynamic jsonData = json.decode(response.body);

      return response.statusCode == 200 && jsonData['status'];
    } catch (e) {
      rethrow;
    }
  }
}

class CompanyParams extends Equatable {
  final int page, pageSize;
  final String userId, categoryId;
  final String? subCategoryId;

  const CompanyParams({
    required this.page,
    required this.pageSize,
    required this.userId,
    required this.categoryId,
    this.subCategoryId,
  });

  CompanyParams copyWith({
    int? page,
    int? pageSize,
    String? userId,
    String? categoryId,
    String? subCategoryId,
  }) {
    return CompanyParams(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
    );
  }

  @override
  List<Object?> get props => [
    page,
    pageSize,
    userId,
    categoryId,
    subCategoryId,
  ];
}
