import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/services/api/banner.dart';

final Provider<BannerApiService> bannerApiProvider = Provider<BannerApiService>(
  (ref) => BannerApiService(),
);
