import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/more_button.dart';
import 'package:kerwenli_yol/pages/parts/share_button.dart';

class CompanyPageTop extends StatelessWidget {
  const CompanyPageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackLeadingButton(text: 'VIP Karhanalar'),
              Row(
                children: [
                  ShareButton(onPressed: () {}),
                  SizedBox(width: 20),
                  MoreButton(onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
        AppBarBottomLine(thickness: 2),
      ],
    );
  }
}
