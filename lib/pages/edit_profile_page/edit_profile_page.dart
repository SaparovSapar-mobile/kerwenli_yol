import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/edit_profile_page/parts/edit_profile_form.dart';
import 'package:kerwenli_yol/pages/onboard_page/parts/theme_switcher_button.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _emailCtrl;

  final GlobalKey<FormState> formKeyForPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForEmail = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameCtrl = TextEditingController(text: widget.user.name);
    // в поле уже есть префикс "+993 |", поэтому код страны убираем
    _phoneCtrl = TextEditingController(
      text: widget.user.phone
          .replaceAll(RegExp(r'[\s-]'), '')
          .replaceFirst(RegExp(r'^\+?993'), ''),
    );
    _emailCtrl = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;
    final Color formBgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackLeadingButton(),
          title: Text(lang.edit),
          centerTitle: true,
          backgroundColor: bgColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 16),
              child: ThemeSwitcherButton(),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(94),
            child: Column(
              children: [
                AppBarBottomLine(),
                const SizedBox(height: 24),
                SelectionButton(title1: lang.phoneNumber, title2: lang.email),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBarView(
            children: [
              EditProfileForm(
                formKey: formKeyForPhone,
                nameCtrl: _nameCtrl,
                userId: widget.user.id,
                formBgColor: formBgColor,
                // номер телефона менять нельзя
                contactInput: PhoneInput(ctrl: _phoneCtrl, readOnly: true),
              ),
              EditProfileForm(
                formKey: formKeyForEmail,
                nameCtrl: _nameCtrl,
                userId: widget.user.id,
                formBgColor: formBgColor,
                contactInput: EmailInput(ctrl: _emailCtrl, readOnly: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
