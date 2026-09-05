import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/filter_bottom_sheet/parts/filter_expansion_tile.dart';
import 'package:kerwenli_yol/pages/parts/primary_button.dart';
import 'package:kerwenli_yol/providers/api/category.dart';

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final AsyncValue<List<CategoryModel>> categories = ref.watch(
      fetchCategoriesProvider,
    );

    final double maxListHeight = MediaQuery.of(context).size.height * 0.55;

    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: lang.filter),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxListHeight),
          child: categories.when(
            loading: () => Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: loadWidget,
            ),
            error: (error, stackTrace) => const SizedBox.shrink(),
            data: (datas) {
              final List<CategoryModel> withSubs = datas
                  .where((c) => c.subCategories.isNotEmpty)
                  .toList();

              if (withSubs.isEmpty) return const SizedBox.shrink();

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    withSubs.length,
                    (index) => FilterExpansionTile(
                      category: withSubs[index],
                      initiallyExpanded: index == 0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
        PrimaryButton(text: lang.sort, onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}
