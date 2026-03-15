import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/favorite.dart';
import 'package:kerwenli_yol/models/favorite.dart';

final hasInFavoritesProvider = FutureProvider.autoDispose
    .family<bool, FavoriteModel>((ref, favorite) async {
      return await hasInFavorites(favorite);
    });
