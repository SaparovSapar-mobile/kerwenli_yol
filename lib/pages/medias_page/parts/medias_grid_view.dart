import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/parts/media_card/media_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/providers/api/media.dart';
import 'package:kerwenli_yol/providers/pages/medias_page.dart';

class MediasGridView extends ConsumerWidget {
  const MediasGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasMediasProvider);
    final bool loading = ref.watch(loadMediasProvider);
    final bool hasErr = ref.watch(hasErrMediasProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult(ref: ref, apiProviders: [fetchMediasProvider]);
    } else if (!hasErr) {
      returnWidget = GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          mainAxisExtent: mediaCardHeight,
        ),
        // itemBuilder: (context, index) => MediaCard(),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final DefaultParams arg = DefaultParams(
            page: page,
            pageSize: pageSize,
          );
          final AsyncValue<List<MediaModel>> resultApi = ref.watch(
            fetchMediasProvider(arg),
          );

          return resultApi.when(
            data: (response) {
              if (indexInPage >= response.length) {
                return null;
              }

              final MediaModel media = response[indexInPage];
              return MediaCard(media: media);
            },
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () {
              if (!loading) {
                Future.delayed(
                  const Duration(),
                  () => ref.read(loadMediasProvider.notifier).state = true,
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

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}
