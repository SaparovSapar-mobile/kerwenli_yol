import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/search.dart';
import 'package:kerwenli_yol/enums/search_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/search_page/parts/search_history_card.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SearchHistory extends ConsumerWidget {
  const SearchHistory({super.key});

  final String searcType = SearchTypeEnum.all;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors =========
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color iconColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    final TextStyle titleStyle = AppTextStyles.semiBold14.copyWith(
      color: iconColor,
    );

    final AsyncValue<List<String>> resultDB = ref.watch(
      getSearchsProvider(searcType),
    );

    final List<String> data = resultDB.value ?? [];
    final bool hasHistory = resultDB.hasValue && data.isNotEmpty;

    if (!hasHistory) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(left: 16, top: 6, right: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${lang.searchHistory} :', style: titleStyle),
          SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => SearchHistoryCard(
                searchText: data[index],
                searcType: searcType,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 23),
              itemCount: data.length,
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 8),
            child: Divider(height: 1),
          ),
          Center(
            child: TextButton(
              onPressed: () async {
                await removeSearchs();
                ref.invalidate(getSearchsProvider);
              },
              child: Text(lang.clear, style: titleStyle),
            ),
          ),
        ],
      ),
    );
  }
}
