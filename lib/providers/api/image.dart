import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/services/api/image.dart';

final Provider<ImageApiService> imageApiProvider = Provider<ImageApiService>(
  (ref) => ImageApiService(),
);

final AutoDisposeFutureProviderFamily<String, ImageParams> imageUploadProvider =
    FutureProvider.autoDispose.family<String, ImageParams>((ref, arg) async {
      String result = '';

      try {
        result = await ref.read(imageApiProvider).imageUpload(arg);
      } catch (e) {
        result = '';
      }

      return result;
    });
