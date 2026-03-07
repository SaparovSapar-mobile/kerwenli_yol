import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/parts/app_bar_methods.dart';
import 'package:kerwenli_yol/pages/parts/back_leading_button.dart';
import 'package:kerwenli_yol/pages/parts/more_button.dart';
import 'package:kerwenli_yol/pages/parts/share_button.dart';

class CompanyPageTop extends StatelessWidget {
  const CompanyPageTop({
    super.key,
    required this.text,
    required this.showBottomLine,
    required this.onPressed,
    this.leftPadding,
  });

  final String text;
  final bool showBottomLine;
  final void Function() onPressed;
  final double? leftPadding;

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
              Expanded(
                child: BackLeadingButton(text: text, leftPadding: leftPadding),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShareButton(onPressed: () {}),
                  SizedBox(width: 20),
                  MoreButton(onPressed: onPressed),
                ],
              ),
            ],
          ),
        ),
        showBottomLine ? AppBarBottomLine(thickness: 2) : SizedBox.shrink(),
      ],
    );
  }
}
