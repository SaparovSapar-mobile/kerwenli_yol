import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';

class CompanyPageTop extends StatelessWidget {
  const CompanyPageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 20, right: 20),
      child: Row(children: [BackLeadingButton(text: 'VIP Karhanalar')]),
    );
  }
}
