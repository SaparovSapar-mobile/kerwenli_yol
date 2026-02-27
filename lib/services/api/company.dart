import 'dart:convert';

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
