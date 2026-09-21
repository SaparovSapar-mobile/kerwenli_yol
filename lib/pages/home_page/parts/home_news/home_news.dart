import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_news/parts/home_news_list.dart';
import 'package:kerwenli_yol/pages/news_page/news_page.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_news_shimmer/home_news_shimmer.dart';
import 'package:kerwenli_yol/providers/api/news.dart';

class HomeNews extends ConsumerWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final DefaultParams arg = DefaultParams(page: 1, pageSize: 10);
    final AsyncValue<List<NewsModel>> resultApi = ref.watch(
      fetchNewsProvider(arg),
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeMoreButton(
              text: lang.news,
              onTap: () => goToPage(
                context,
                NewsPage(),
                AxisDirection.left,
                name: 'news',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 10),
              child: HomeNewsList(news: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeNewsShimmer(),
    );
  }
}
