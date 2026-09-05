import 'package:flutter/material.dart';
import 'package:kerwenli_yol/models/award.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class CompanyInfoSertificatesList extends StatelessWidget {
  const CompanyInfoSertificatesList({super.key, required this.awards});

  final List<AwardModel> awards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final AwardModel award = awards[index];

          return SizedBox(
            width: 65,
            child: award.img.isEmpty
                ? const SizedBox.shrink()
                : ShowNetwImage(image: award.img, borderRadius: 8),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: awards.length,
      ),
    );
  }
}
