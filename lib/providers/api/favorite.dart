import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/user.dart';
import 'package:kerwenli_yol/models/add_p_favorite.dart';
import 'package:kerwenli_yol/services/api/favorites.dart';

final Provider<FavoritesApiService> favoriteApiProvider =
    Provider<FavoritesApiService>((ref) => FavoritesApiService());

final AutoDisposeFutureProviderFamily<bool, String> addProductFavoriteProvider =
    FutureProvider.autoDispose.family<bool, String>((ref, arg) async {
      bool result = false;

      try {
        final String userId = await getUserId();
        AddPFavoriteModel params = AddPFavoriteModel(
          userId: userId,
          productId: arg,
        );
        result = await ref.read(favoriteApiProvider).addProductFavorite(params);
      } catch (e) {
        rethrow;
      }
      return result;
    });
