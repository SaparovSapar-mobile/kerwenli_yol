import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/about_us.dart';
import 'package:kerwenli_yol/services/api/about_us.dart';

final Provider<AboutUsApiService> aboutUseApiProvider =
    Provider<AboutUsApiService>((ref) => AboutUsApiService());

final AutoDisposeFutureProvider<AboutUsModel> fetchAboutUsProvider =
    FutureProvider.autoDispose<AboutUsModel>((ref) async {
      AboutUsModel result = AboutUsModel.defaultValue();

      try {
        result = await ref.read(aboutUseApiProvider).fetchAboutUs();
      } catch (e) {
        rethrow;
      }
      return result;
    });
