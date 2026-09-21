import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/providers/pages/bookmarks_page.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

/// Поле поиска в шапке страницы закладок.
/// Появляется вместо заголовка, когда нажата лупа.
class BookmarkSearchField extends ConsumerStatefulWidget {
  const BookmarkSearchField({super.key});

  @override
  ConsumerState<BookmarkSearchField> createState() =>
      _BookmarkSearchFieldState();
}

class _BookmarkSearchFieldState extends ConsumerState<BookmarkSearchField> {
  late final TextEditingController controller;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: ref.read(bookmarkSearchProvider));

    // клавиатура открывается сразу - иначе нужен лишний тап по полю
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _close() {
    ref.read(bookmarkSearchProvider.notifier).state = '';
    ref.read(bookmarkSearchOpenProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ======= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color fieldColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color hintColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    // ровно столько же, сколько занимает строка с заголовком и кнопками,
    // иначе шапка прыгает при открытии поиска
    return SizedBox(
      height: 38,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: AppTextStyles.regular12.copyWith(color: textColor),
        textInputAction: TextInputAction.search,
        onChanged: (value) =>
            ref.read(bookmarkSearchProvider.notifier).state = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: fieldColor,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 9),
          hintText: lang.search,
          hintStyle: AppTextStyles.regular12.copyWith(color: hintColor),
          prefixIcon: Icon(Icons.search, size: 20, color: hintColor),
          suffixIcon: GestureDetector(
            onTap: _close,
            child: Icon(Icons.close, size: 20, color: textColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
