import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/enums/favorite_type.dart';
import 'package:kerwenli_yol/helpers/functions/user.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
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

final AutoDisposeFutureProviderFamily<List<CompanyModel>, CompanyParams>
fetchBookmarkedCompaniesProvider = FutureProvider.family
    .autoDispose<List<CompanyModel>, CompanyParams>((ref, arg) async {
      List<CompanyModel> result = [];

      try {
        final String userId = await getUserId();
        CompanyParams params = arg.copyWith(userId: userId);

        result = await ref
            .read(companyApiProvider)
            .fetchBookmarkedCompanies(params);
        if (arg.page == 1) {
          ref.read(hasBCompaniesProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrBCompaniesProvider.notifier).state = false;
        }

        if (result.isNotEmpty) {
          for (final CompanyModel company in result) {
            final FavoriteModel params = FavoriteModel(
              id: company.individualUuid,
              type: FavoriteTypeEnum.company,
            );

            if (!await hasInFavorites(params)) {
              await addOrRemoveFromFavorites(params);
            }
          }
        }
      } catch (e) {
        ref.read(hasErrBCompaniesProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadBCompaniesProvider.notifier).state = false;
      return result;
    });
