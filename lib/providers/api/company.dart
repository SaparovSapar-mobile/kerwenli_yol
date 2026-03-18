import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/enums/favorite_type.dart';
import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/favorite.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/providers/pages/companies_page.dart';
import 'package:kerwenli_yol/services/api/company.dart';

final Provider<CompanyApiService> companyApiProvider =
    Provider<CompanyApiService>((ref) => CompanyApiService());

final FutureProvider<List<CompanyModel>> fetchVipCompaniesProvider =
    FutureProvider<List<CompanyModel>>((ref) async {
      List<CompanyModel> datas = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        datas = await ref.read(companyApiProvider).fetchVipCompanies(userId);

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_bookmarked we is_followed  maglumatlar true gelse
        // bookmark ve follow local db save edilyar
        if (userId != '' && datas.isNotEmpty) {
          for (final CompanyModel e in datas) {
            if (e.isBookmarked) {
              final FavoriteModel bp = FavoriteModel(
                id: e.individualUuid,
                type: FavoriteTypeEnum.company,
              );
              if (!await hasInFavorites(bp)) {
                await addOrRemoveFromFavorites(bp);
              }
            }

            if (e.isFollowed) {
              final FavoriteModel fp = FavoriteModel(
                id: e.individualUuid,
                type: FavoriteTypeEnum.companyFollow,
              );

              if (!await hasInFavorites(fp)) {
                await addOrRemoveFromFavorites(fp);
              }
            }
          }
        }
      } catch (e) {
        rethrow;
      }

      return datas;
    });

final FutureProvider<List<CompanyModel>> fetchTravelsProvider =
    FutureProvider<List<CompanyModel>>((ref) async {
      List<CompanyModel> datas = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        datas = await ref.read(companyApiProvider).fetchTravels(userId);

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_bookmarked we is_followed  maglumatlar true gelse
        // bookmark ve follow local db save edilyar
        if (userId != '' && datas.isNotEmpty) {
          for (final CompanyModel e in datas) {
            if (e.isBookmarked) {
              final FavoriteModel bp = FavoriteModel(
                id: e.individualUuid,
                type: FavoriteTypeEnum.company,
              );
              if (!await hasInFavorites(bp)) {
                await addOrRemoveFromFavorites(bp);
              }
            }

            if (e.isFollowed) {
              final FavoriteModel fp = FavoriteModel(
                id: e.individualUuid,
                type: FavoriteTypeEnum.companyFollow,
              );

              if (!await hasInFavorites(fp)) {
                await addOrRemoveFromFavorites(fp);
              }
            }
          }
        }
      } catch (e) {
        rethrow;
      }

      return datas;
    });

final FutureProvider<List<CompanyModel>> fetchBestCompaniesProvider =
    FutureProvider<List<CompanyModel>>((ref) async {
      List<CompanyModel> datas = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        datas = await ref.read(companyApiProvider).fetchBestCompanies(userId);

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_bookmarked we is_followed  maglumatlar true gelse
        // bookmark ve follow local db save edilyar
        if (userId != '' && datas.isNotEmpty) {
          for (final CompanyModel e in datas) {
            if (e.isBookmarked) {
              final FavoriteModel bp = FavoriteModel(
                id: e.individualUuid,
                type: FavoriteTypeEnum.company,
              );
              if (!await hasInFavorites(bp)) {
                await addOrRemoveFromFavorites(bp);
              }
            }

            if (e.isFollowed) {
              final FavoriteModel fp = FavoriteModel(
                id: e.individualUuid,
                type: FavoriteTypeEnum.companyFollow,
              );

              if (!await hasInFavorites(fp)) {
                await addOrRemoveFromFavorites(fp);
              }
            }
          }
        }
      } catch (e) {
        rethrow;
      }

      return datas;
    });

final AutoDisposeFutureProviderFamily<List<CompanyDetailModel>, CompanyParams>
fetchCompaniesByCategoryIdProvider = FutureProvider.family
    .autoDispose<List<CompanyDetailModel>, CompanyParams>((ref, arg) async {
      List<CompanyDetailModel> datas = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        CompanyParams params = arg.copyWith(userId: userId);
        datas = await ref
            .read(companyApiProvider)
            .fetchCompaniesByCategoryId(params);

        if (arg.page == 1) {
          ref.read(hasCompaniesProvider.notifier).state = datas.isNotEmpty;
          ref.read(hasErrCompaniesProvider.notifier).state = false;
        }

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_bookmarked we is_followed  maglumatlar true gelse
        // bookmark ve follow local db save edilyar
        if (userId != '' && datas.isNotEmpty) {
          for (final CompanyDetailModel e in datas) {
            if (e.isBookmarked) {
              final FavoriteModel bp = FavoriteModel(
                id: e.id,
                type: FavoriteTypeEnum.company,
              );
              if (!await hasInFavorites(bp)) {
                await addOrRemoveFromFavorites(bp);
              }
            }

            if (e.isFollowed) {
              final FavoriteModel fp = FavoriteModel(
                id: e.id,
                type: FavoriteTypeEnum.companyFollow,
              );

              if (!await hasInFavorites(fp)) {
                await addOrRemoveFromFavorites(fp);
              }
            }
          }
        }
      } catch (e) {
        ref.read(hasErrCompaniesProvider.notifier).state = e
            .toString()
            .isNotEmpty;
      }

      ref.read(loadCompaniesProvider.notifier).state = false;
      return datas;
    });

final AutoDisposeFutureProviderFamily<CompanyDetailModel, String>
fetchCompanyProvider = FutureProvider.autoDispose
    .family<CompanyDetailModel, String>((ref, arg) async {
      CompanyDetailModel result = CompanyDetailModel.defaultValue();

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        result = await ref.read(companyApiProvider).fetchCompany(arg, userId);

        // Eger user id bar bolsa we maglumat bos dal bolsa
        // we api - den is_bookmarked we is_followed  maglumatlar true gelse
        // bookmark ve follow local db save edilyar
        if (userId != '' && result.id != '') {
          if (result.isBookmarked) {
            final FavoriteModel bp = FavoriteModel(
              id: result.id,
              type: FavoriteTypeEnum.company,
            );
            if (!await hasInFavorites(bp)) {
              await addOrRemoveFromFavorites(bp);
            }
          }

          if (result.isFollowed) {
            final FavoriteModel fp = FavoriteModel(
              id: result.id,
              type: FavoriteTypeEnum.companyFollow,
            );

            if (!await hasInFavorites(fp)) {
              await addOrRemoveFromFavorites(fp);
            }
          }
        }
      } catch (e) {
        rethrow;
      }
      return result;
    });

final AutoDisposeFutureProviderFamily<List<CompanyDetailModel>, CompanyParams>
fetchBookmarkedCompaniesProvider = FutureProvider.family
    .autoDispose<List<CompanyDetailModel>, CompanyParams>((ref, arg) async {
      List<CompanyDetailModel> result = [];

      try {
        final String userId = await ref.watch(getUserIdProvider.future);
        CompanyParams params = arg.copyWith(userId: userId);

        result = await ref
            .read(companyApiProvider)
            .fetchBookmarkedCompanies(params);

        if (arg.page == 1) {
          ref.read(hasBCompaniesProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrBCompaniesProvider.notifier).state = false;
        }

        if (result.isNotEmpty) {
          for (final CompanyDetailModel company in result) {
            final FavoriteModel params = FavoriteModel(
              id: company.id,
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
