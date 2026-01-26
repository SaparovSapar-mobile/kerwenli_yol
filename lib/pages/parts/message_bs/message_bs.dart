import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/message_bs_with_email.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/message_bs_with_phone.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';

class MessageBs extends StatefulWidget {
  const MessageBs({super.key, required this.title, required this.image});

  final String title, image;

  @override
  State<MessageBs> createState() => _MessageBsState();
}

class _MessageBsState extends State<MessageBs> {
  final TextEditingController _emailCtrl = TextEditingController(
    text: 'exampleEmail@gmail.com',
  );
  final TextEditingController _phoneCtrl = TextEditingController(
    text: '63 509004',
  );
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
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: bottom), // ✅ klavye kadar yukarı iter
      child: BottomSheetWidget(
        children: [
          BottomSheetTitle(text: widget.title, icon: widget.image),
          DefaultTabController(
            length: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectionButton(
                  title1: 'Telefon Belgi',
                  title2: 'Email',
                  horizontalMargin: 0,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 330,
                  child: TabBarView(
                    children: [
                      MessageBsWithPhone(
                        formKey: formKeyForPhone,
                        phoneCtrl: _phoneCtrl,
                        messageCtrl: _messageCtrl,
                      ),
                      MessageBsWithEmail(
                        formKey: formKeyForEmail,
                        emailCtrl: _emailCtrl,
                        messageCtrl: _messageCtrl,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
