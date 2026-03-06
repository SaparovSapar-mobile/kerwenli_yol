import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_news/parts/home_news_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/providers/api/news.dart';
import 'package:kerwenli_yol/providers/pages/news_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class NewsListView extends ConsumerWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ========== Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    final bool hasData = ref.watch(hasNewsProvider);
    final bool loading = ref.watch(loadNewsProvider);
    final bool hasErr = ref.watch(hasErrNewsProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult(ref: ref, apiProviders: [fetchNewsProvider]);
    } else if (!hasErr) {
      returnWidget = ListView.builder(
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final DefaultParams arg = DefaultParams(
            page: page,
            pageSize: pageSize,
          );
          final AsyncValue<List<NewsModel>> resultApi = ref.watch(
            fetchNewsProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final NewsModel news = response[indexInPage];
              return HomeNewsCard(news: news, forListView: true);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadNewsProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = Text('has error');
    }

    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(children: [returnWidget, if (loading) loadWidget]),
    );
  }
}
