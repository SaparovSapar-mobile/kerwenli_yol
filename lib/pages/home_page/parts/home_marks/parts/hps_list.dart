import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/translations.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/models/mark.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_leader_companies/parts/home_leader_company_card.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_marks_shimmer/marks_shimmer.dart';
import 'package:kerwenli_yol/providers/api/mark.dart';

class HpsList extends ConsumerWidget {
  const HpsList({
    super.key,
    required this.scrollController,
    required this.markTypeId,
  });

  final ScrollController scrollController;
  final String markTypeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MarkModel>> resultApi = ref.watch(
      fetchMarksProvider(markTypeId),
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return SizedBox.shrink();
        }

        return SizedBox(
          height: homeBestCompaniesCardHeight,
          child: ListView.separated(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final MarkModel mark = data[index];
              final TranslationModel bn = mark.businessName;
              final String name = translateText(ref, bn.tm, bn.ru, bn.en);
              return HomeLeaderCompanyCard(
                name: name,
                companyId: mark.companyId,
                image: mark.image,
              );
            },
            separatorBuilder: (_, _) => SizedBox(width: 5),
            itemCount: data.length,
          ),
        );
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => MarksShimmer(),
    );
  }
}
