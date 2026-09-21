import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/functions/theme.dart';
import 'package:kerwenli_yol/helpers/methods/pages/home_page.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/about_us_page/parts/about_us_part.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/internet_status_bar.dart';
import 'package:kerwenli_yol/pages/parts/inputs/email_input.dart';
import 'package:kerwenli_yol/pages/parts/inputs/phone_input.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';
import 'package:kerwenli_yol/pages/write_message_page/parts/write_message_form.dart';
import 'package:kerwenli_yol/providers/database/user.dart';
import 'package:kerwenli_yol/styles/colors/dark_colors.dart';
import 'package:kerwenli_yol/styles/colors/light_colors.dart';

class WriteMessagePage extends ConsumerStatefulWidget {
  const WriteMessagePage({super.key});

  @override
  ConsumerState<WriteMessagePage> createState() => _WriteMessagePageState();
}

class _WriteMessagePageState extends ConsumerState<WriteMessagePage> {
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _messageCtrl = TextEditingController();

  final GlobalKey<FormState> formKeyForPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForEmail = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    // ========= Colors =======
    final bool isLight = isLightTheme(context, ref);
    final Color bgColor = isLight
        ? LightColors.bgPageLight
        : DarkColors.bgPageDark;
    final Color innerBgColor = isLight
        ? LightColors.bgBlogLight
        : DarkColors.bgBlogDark;

    final AsyncValue<UserModel> resultDB = ref.watch(getUserProvider);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: homePageAppBar(context),
      body: Column(
        children: [
          InternetStatusBar(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: innerBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackLeadingButton(text: lang.back, leftPadding: 0),
                  AboutUsPart(icon: Icons.forum, text: lang.writeMessage),
                  Expanded(
                    child: resultDB.when(
                      data: (user) {
                        // контакты подставляем из профиля, менять их нельзя
                        if (user.phone.isNotEmpty) {
                          // в поле уже есть префикс "+993 |"
                          _phoneCtrl.text = user.phone
                              .replaceAll(RegExp(r'[\s-]'), '')
                              .replaceFirst(RegExp(r'^\+?993'), '');
                        }
                        if (user.email.isNotEmpty) {
                          _emailCtrl.text = user.email;
                        }

                        return DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              SelectionButton(
                                title1: lang.phoneNumber,
                                title2: lang.email,
                                horizontalMargin: 0,
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    WriteMessageForm(
                                      formKey: formKeyForPhone,
                                      contactCtrl: _phoneCtrl,
                                      messageCtrl: _messageCtrl,
                                      isPhone: true,
                                      contactInput: PhoneInput(
                                        ctrl: _phoneCtrl,
                                        readOnly: true,
                                      ),
                                    ),
                                    WriteMessageForm(
                                      formKey: formKeyForEmail,
                                      contactCtrl: _emailCtrl,
                                      messageCtrl: _messageCtrl,
                                      isPhone: false,
                                      contactInput: EmailInput(
                                        ctrl: _emailCtrl,
                                        readOnly: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      error: (_, _) => const SizedBox.shrink(),
                      loading: () => loadWidget,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
