import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/sertificate_card.dart';

class CompanyInfoSertificatesList extends StatelessWidget {
  const CompanyInfoSertificatesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SertificateCard(),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: 10,
      ),
    );
  }
}
