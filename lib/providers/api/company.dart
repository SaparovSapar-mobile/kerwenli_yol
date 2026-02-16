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

final FutureProvider<List<CompanyModel>> fetchTravelsProvider =
    FutureProvider<List<CompanyModel>>((ref) async {
      List<CompanyModel> datas = [];

      try {
        datas = await ref.read(companyApiProvider).fetchTravels();
      } catch (e) {
        rethrow;
      }

      return datas;
    });

final FutureProvider<List<CompanyModel>> fetchBestCompaniesProvider =
    FutureProvider<List<CompanyModel>>((ref) async {
      List<CompanyModel> datas = [];

      try {
        datas = await ref.read(companyApiProvider).fetchBestCompanies();
      } catch (e) {
        rethrow;
      }

      return datas;
    });

final AutoDisposeFutureProviderFamily<CompanyDetailModel, String>
fetchCompanyProvider = FutureProvider.autoDispose
    .family<CompanyDetailModel, String>((ref, arg) async {
      CompanyDetailModel result = CompanyDetailModel.defaultValue();

      try {
        result = await ref.read(companyApiProvider).fetchCompany(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });
