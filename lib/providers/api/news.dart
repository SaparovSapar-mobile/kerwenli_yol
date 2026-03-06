import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/providers/pages/news_page.dart';
import 'package:kerwenli_yol/services/api/news.dart';

final Provider<NewsApiService> newsApiProvider = Provider<NewsApiService>(
  (ref) => NewsApiService(),
);

final FutureProviderFamily<List<NewsModel>, DefaultParams> fetchNewsProvider =
    FutureProvider.family<List<NewsModel>, DefaultParams>((ref, arg) async {
      List<NewsModel> result = [];

      try {
        result = await ref.read(newsApiProvider).fetchNews(arg);
        if (arg.page == 1) {
          ref.read(hasNewsProvider.notifier).state = result.isNotEmpty;
          ref.read(hasErrNewsProvider.notifier).state = false;
        }
      } catch (e) {
        ref.read(hasErrNewsProvider.notifier).state = e.toString().isNotEmpty;
      }

      ref.read(loadNewsProvider.notifier).state = false;
      return result;
    });

final AutoDisposeFutureProviderFamily<NewsModel, String>
fetchNewsDetailProvider = FutureProvider.autoDispose.family<NewsModel, String>((
  ref,
  arg,
) async {
  NewsModel result = NewsModel.defaultValue();

  try {
    result = await ref.read(newsApiProvider).fetchNewsDetail(arg);
  } catch (e) {
    rethrow;
  }
  return result;
});
