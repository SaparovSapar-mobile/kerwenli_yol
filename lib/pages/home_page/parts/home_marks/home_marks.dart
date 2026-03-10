import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/models/mark_type.dart';
import 'package:kerwenli_yol/pages/home_page/parts/home_marks/parts/home_marks_slider.dart';
import 'package:kerwenli_yol/pages/parts/shimmer_effects/home_marks_shimmer/home_marks_shimmer.dart';
import 'package:kerwenli_yol/providers/api/mark_type.dart';

class HomeMarks extends ConsumerWidget {
  const HomeMarks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<MarkTypeModel>> resultApi = ref.watch(
      fetchMarkTypesProvider,
    );

    return resultApi.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        List<MarkTypeModel> markTypes = data;
        return HomeMarksSlider(markTypes: markTypes);
      },
      error: (_, _) => const SizedBox.shrink(),
      loading: () => HomeMarksShimmer(),
    );
  }
}
