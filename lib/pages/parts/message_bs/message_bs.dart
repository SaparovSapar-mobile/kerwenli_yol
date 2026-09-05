import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:kerwenli_yol/l10n/app_localizations.dart';
import 'package:kerwenli_yol/models/user.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/message_bs_with_email.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/message_bs_with_phone.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';
import 'package:kerwenli_yol/providers/database/user.dart';

class MessageBs extends StatefulWidget {
  const MessageBs({
    super.key,
    required this.title,
    required this.image,
    required this.companyId,
  });

  final String title, image, companyId;

  @override
  State<MessageBs> createState() => _MessageBsState();
}

class _MessageBsState extends State<MessageBs> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _messageCtrl = TextEditingController();
  final GlobalKey<FormState> formKeyForPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForEmail = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations lang = AppLocalizations.of(context)!;

    final double bottom = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: bottom),
      child: BottomSheetWidget(
        children: [
          BottomSheetTitle(text: widget.title, icon: widget.image),
          Consumer(
            builder: (context, ref, child) {
              final AsyncValue<UserModel> resultDB = ref.watch(getUserProvider);

              return resultDB.when(
                data: (data) {
                  if (data.email != '') {
                    _emailCtrl.text = data.email;
                  }

                  if (data.phone != '') {
                    // в поле уже есть префикс "+993 |", поэтому код страны убираем
                    _phoneCtrl.text = data.phone
                        .replaceAll(RegExp(r'[\s-]'), '')
                        .replaceFirst(RegExp(r'^\+?993'), '');
                  }

                  return DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelectionButton(
                          title1: lang.phoneNumber,
                          title2: lang.email,
                          horizontalMargin: 0,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 330,
                          child: TabBarView(
                            children: [
                              MessageBsWithPhone(
                                companyId: widget.companyId,
                                formKey: formKeyForPhone,
                                phoneCtrl: _phoneCtrl,
                                messageCtrl: _messageCtrl,
                              ),
                              MessageBsWithEmail(
                                formKey: formKeyForEmail,
                                emailCtrl: _emailCtrl,
                                messageCtrl: _messageCtrl,
                                companyId: widget.companyId,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
