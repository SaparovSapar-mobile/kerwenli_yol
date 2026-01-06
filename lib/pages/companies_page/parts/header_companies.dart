import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';

class HeaderCompanies extends StatelessWidget {
  const HeaderCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BackLeadingButton(text: 'VIP Karhanalar'),
        ),
        AppBarBottomLine(thickness: 2),
      ],
    );
  }
}
