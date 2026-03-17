import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/add_c_bookmark.dart';
import 'package:kerwenli_yol/models/add_p_favorite.dart';
import 'package:kerwenli_yol/services/api/favorites.dart';

final Provider<FavoritesApiService> favoriteApiProvider =
    Provider<FavoritesApiService>((ref) => FavoritesApiService());

final AutoDisposeFutureProviderFamily<bool, AddPFavoriteModel>
addProductFavoriteProvider = FutureProvider.autoDispose
    .family<bool, AddPFavoriteModel>((ref, arg) async {
      bool result = false;

      try {
        result = await ref.read(favoriteApiProvider).addProductFavorite(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });

final AutoDisposeFutureProviderFamily<bool, AddCBookmarkModel>
addCompanyBookmarkProvider = FutureProvider.autoDispose
    .family<bool, AddCBookmarkModel>((ref, arg) async {
      bool result = false;

      try {
        result = await ref.read(favoriteApiProvider).addCompanyBookmark(arg);
      } catch (e) {
        rethrow;
      }
      return result;
    });
