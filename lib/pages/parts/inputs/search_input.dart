import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/database/functions/search.dart';
import 'package:kerwenli_yol/enums/search_type.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/pages/parts/circle_button.dart';
import 'package:kerwenli_yol/providers/api/search.dart';
import 'package:kerwenli_yol/providers/pages/search_page.dart';
import 'package:kerwenli_yol/providers/parts/file_upload.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';
import 'dart:async'; // 👈 добавь

class SearchInput extends ConsumerStatefulWidget { // 👈 StatefulWidget
  const SearchInput({super.key});

  @override
  ConsumerState<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  Timer? _debounce; // 👈 таймер для debounce

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors ======
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color hintColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    final Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color borderColor = iconColor.withValues(alpha: .2);

    // ======= Text Styles ======
    final TextStyle hintStyle = AppTextStyles.medium16.copyWith(
      color: hintColor,
    );

    String searchText = ref.watch(searchECommerceTextProvider);
    final hasSearchText = searchText.isNotEmpty;

    return SizedBox(
      height: 38,
      child: Row(
        children: [
          // ======== Search Input =========
          Expanded(
            child: SearchBar(
              backgroundColor: WidgetStateProperty.all<Color>(bgColor),
              elevation: WidgetStateProperty.all<double>(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: borderColor),
                ),
              ),
              hintText: lang.search,
              hintStyle: WidgetStateProperty.all<TextStyle>(hintStyle),
              leading: Icon(Icons.search, color: hintColor),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.only(left: 16),
              ),
              onChanged: (value) {
                // 👇 Обновляем UI сразу — без сохранения в историю
                ref.read(isVisualSearchModeProvider.notifier).state = false;
                ref.read(visualSearchResultProvider.notifier).state = null;
                ref.read(searchECommerceTextProvider.notifier).state = value;
                ref.read(eCommerceSearchProvider.notifier).state = value;
                ref.read(openSearchECommerceHistoryProvider.notifier).state = false;

                // 👇 Отменяем предыдущий таймер
                _debounce?.cancel();
              },
              onSubmitted: (value) async {
                // 👇 Сохраняем в историю ТОЛЬКО при нажатии Enter/Submit
                if (value.isNotEmpty) {
                  ref.read(isVisualSearchModeProvider.notifier).state = false;
                  ref.read(visualSearchResultProvider.notifier).state = null;

                  await createSearch(value, SearchTypeEnum.all); // ✅ только здесь

                  ref.read(searchECommerceTextProvider.notifier).state = value;
                  ref.read(eCommerceSearchProvider.notifier).state = value;
                  ref.read(openSearchECommerceHistoryProvider.notifier).state = false;

                  ref.invalidate(getSearchsProvider);
                  ref.invalidate(fetchSearchProvider);
                }
              },
              trailing: [
                if (hasSearchText)
                  IconButton(
                    onPressed: () {
                      _debounce?.cancel(); // 👈 отменяем таймер при очистке
                      ref.read(isVisualSearchModeProvider.notifier).state = false;
                      ref.read(visualSearchResultProvider.notifier).state = null;
                      ref.read(eCommerceSearchProvider.notifier).state = '';
                      ref.read(searchECommerceTextProvider.notifier).state = '';
                      ref.read(openSearchECommerceHistoryProvider.notifier).state = true;
                      ref.invalidate(fetchSearchProvider);
                    },
                    icon: Icon(Icons.cancel, color: iconColor, size: 20),
                  ),
              ],
            ),
          ),
          // ======== Search With Photo =========
          SizedBox(width: 10),
          CircleButton(
            icon: Icons.photo_camera,
            onTap: () => showSelectImageBottomSheet(context),
          ),
        ],
      ),
    );
  }
}