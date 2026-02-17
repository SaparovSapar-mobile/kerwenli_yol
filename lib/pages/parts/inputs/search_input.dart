import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/bottom_sheets.dart';
import 'package:kerwenli_yol/pages/parts/circle_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({super.key});

  @override
  ConsumerState<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ======= Colors ======
    final bool isLight = isLightTheme(context, ref);
    Color bgColor = isLight ? LightColors.bgPageLight : DarkColors.bgPageDark;
    Color hintColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;
    Color iconColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    Color borderColor = iconColor.withValues(alpha: .2);

    // ======= Text Styles ======
    TextStyle hintStyle = AppTextStyles.medium16.copyWith(color: hintColor);

    return SizedBox(
      height: 38,
      child: Row(
        children: [
          // ======== Search Input =========
          Expanded(
            child: SearchBar(
              controller: _ctrl,
              backgroundColor: WidgetStateProperty.all<Color>(bgColor),
              elevation: WidgetStateProperty.all<double>(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: borderColor),
                ),
              ),
              hintText: 'Gozleg',
              hintStyle: WidgetStateProperty.all<TextStyle>(hintStyle),
              leading: Icon(Icons.search, color: hintColor),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.only(left: 16),
              ),
              trailing: [
                IconButton(
                  onPressed: () {},
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
