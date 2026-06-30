import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';
import 'package:kerwenli_yol/styles/text_styles.dart';

class NewPasswordInput extends ConsumerStatefulWidget {
  const NewPasswordInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  ConsumerState<NewPasswordInput> createState() => _NewPasswordInputState();
}

class _NewPasswordInputState extends ConsumerState<NewPasswordInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;
    final bool isLight = isLightTheme(context, ref);

    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color textColor = isLight
        ? LightColors.textTitleLight
        : DarkColors.textTitleDark;
    final Color borderColor = isLight
        ? LightColors.textDescriptionLight
        : DarkColors.textDescriptionDark;

    return TextField(
      controller: widget.controller,
      obscureText: _obscure,
      style: AppTextStyles.medium16.copyWith(color: textColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        hintText: "Täze açaryňyzy giriziň",
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: borderColor,
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}