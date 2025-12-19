import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';

class CompanyPageTop extends StatelessWidget {
  const CompanyPageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [BackLeadingButton(text: 'VIP Karhanalar')]),
        ),
        AppBarBottomLine(thickness: 2),
      ],
    );
  }
}
