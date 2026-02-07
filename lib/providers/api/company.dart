import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/services/api/company.dart';

final Provider<CompanyApiService> companyApiProvider =
    Provider<CompanyApiService>((ref) => CompanyApiService());

final FutureProvider<List<CompanyModel>> fetchVipCompaniesProvider =
    FutureProvider<List<CompanyModel>>((ref) async {
      List<CompanyModel> datas = [];

      try {
        datas = await ref.read(companyApiProvider).fetchVipCompanies();
      } catch (e) {
        rethrow;
      }

      return datas;
    });
