import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/navigation.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/default_params.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_media/parts/home_media_list.dart';
import 'package:kerwenli_yol/pages/medias_page/medias_page.dart';
import 'package:kerwenli_yol/pages/parts/home_more_button.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_media_shimmer/home_media_shimmer.dart';
import 'package:kerwenli_yol/providers/api/media.dart';

class HomeMedia extends ConsumerWidget {
  const HomeMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final DefaultParams arg = DefaultParams(page: 1, pageSize: 10);
    final AsyncValue<List<MediaModel>> resultApi = ref.watch(
      fetchMediasProvider(arg),
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
              text: lang.media,
              onTap: () => goToPage(
                context,
                MediasPage(),
                AxisDirection.left,
                name: 'medias',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: HomeMediaList(medias: data),
            ),
            AppBarBottomLine(thickness: 10),
          ],
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeMediaShimmer(),
    );
  }
}
