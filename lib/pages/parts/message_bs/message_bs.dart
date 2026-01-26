import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/bottom_sheet_widget.dart';
import 'package:kerwenli_yol/pages/parts/bottom_sheet_widget/parts/bottom_sheet_title.dart';
import 'package:kerwenli_yol/pages/parts/message_bs/parts/message_bs_with_phone.dart';
import 'package:kerwenli_yol/pages/parts/selection_button.dart';

class MessageBs extends StatefulWidget {
  const MessageBs({super.key});

  @override
  State<MessageBs> createState() => _MessageBsState();
}

class _MessageBsState extends State<MessageBs> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final GlobalKey<FormState> formKeyForPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForEmail = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      children: [
        BottomSheetTitle(text: 'Hat Yazmak', icon: 'messages.png'),
        DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectionButton(title1: 'Telefon Belgi', title2: 'Email'),
              SizedBox(
                height: 330,
                child: TabBarView(
                  children: [
                    MessageBsWithPhone(
                      formKey: formKeyForPhone,
                      phoneCtrl: _phoneCtrl,
                    ),
                    Text('Email Habarlas'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
