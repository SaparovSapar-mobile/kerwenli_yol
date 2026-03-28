import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/about_us_page/parts/about_us_part.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';

class ContactUsTopPart extends StatelessWidget {
  const ContactUsTopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackLeadingButton(text: 'Yza', leftPadding: 0),
        AboutUsPart(icon: Icons.support_agent, text: 'Biz bilen habarlasmak'),
      ],
    );
  }
}
