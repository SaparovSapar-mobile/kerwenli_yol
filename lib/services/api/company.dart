import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/company.dart';

class CompanyApiService {
  // fetch best companies -----------------------------
  Future<List<CompanyModel>> fetchBestCompanies() async {
    Uri uri = Uri.parse('$apiUrl/client/best-companies');

    try {
      http.Response response = await http.get(uri);
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
    Uri uri = Uri.parse('$apiUrl/client/travel360');

    try {
      http.Response response = await http.get(uri);
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

  // fetch vip companies ---------------------------------
  Future<List<CompanyModel>> fetchVipCompanies() async {
    Uri uri = Uri.parse('$apiUrl/client/vip-companies');

    try {
      http.Response response = await http.get(uri);
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
