import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/banner.dart';
import 'package:kerwenli_yol/services/api/banner.dart';

final Provider<BannerApiService> bannerApiProvider = Provider<BannerApiService>(
  (ref) => BannerApiService(),
);

final FutureProvider<List<BannerModel>> fetchBannersProvider =
    FutureProvider<List<BannerModel>>((ref) async {
      List<BannerModel> datas = [];

      try {
        datas = await ref.read(bannerApiProvider).fetchBanners();
      } catch (e) {
        rethrow;
      }

      return datas;
    });
