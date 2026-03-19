import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/search.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SearchHistoryCard extends ConsumerWidget {
  const SearchHistoryCard({
    super.key,
    required this.searchText,
    required this.searcType,
  });

  final String searchText, searcType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ======= Colors ====
    final bool isLight = isLightTheme(context, ref);
    final Color iconColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    final TextStyle titleStyle = AppTextStyles.medium14.copyWith(
      color: iconColor,
    );

    return ListTile(
      onTap: () {
        ref.read(searchECommerceTextProvider.notifier).state = searchText;
        ref.read(eCommerceSearchProvider.notifier).state = searchText;
        ref.read(openSearchECommerceHistoryProvider.notifier).state = false;
      },
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(Icons.history, color: iconColor, size: 20),
      title: Text(searchText, style: titleStyle),
      trailing: IconButton(
        onPressed: () async {
          await removeSearch(searchText, searcType);
          ref.invalidate(getSearchsProvider);
        },
        icon: Icon(Icons.close, color: iconColor, size: 20),
      ),
    );
  }
}
