import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/parts/media_card/media_card.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';
import 'package:kerwenli_yol/pages/parts/some_error.dart';
import 'package:kerwenli_yol/providers/api/media.dart';
import 'package:kerwenli_yol/providers/pages/medias_page.dart';
import 'package:kerwenli_yol/services/api/media.dart';

class CompanyMediasGridview extends ConsumerWidget {
  const CompanyMediasGridview({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasData = ref.watch(hasCMediasProvider);
    final bool loading = ref.watch(loadCMediasProvider);
    final bool hasErr = ref.watch(hasErrCMediasProvider);

    Widget returnWidget;

    if (!hasData) {
      returnWidget = NoResult();
    } else if (!hasErr) {
      returnWidget = GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          mainAxisExtent: mediaCardHeight,
        ),
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;

          final MediaParams arg = MediaParams(
            page: page,
            pageSize: pageSize,
            companyId: companyId,
          );
          final AsyncValue<List<MediaModel>> resultApi = ref.watch(
            fetchMediasByCompanyIdProvider(arg),
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
                  () => ref.read(loadCMediasProvider.notifier).state = true,
                );
              }
              return null;
            },
          );
        },
      );
    } else {
      returnWidget = SomeError(
        ref: ref,
        apiProviders: [fetchMediasByCompanyIdProvider],
      );
    }

    return Stack(children: [returnWidget, if (loading) loadWidget]);
  }
}
