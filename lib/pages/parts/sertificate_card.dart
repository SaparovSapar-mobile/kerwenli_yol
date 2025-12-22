import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/show_image.dart';

class SertificateCard extends StatelessWidget {
  const SertificateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: ShowImage(
        image: 'assets/examples/sertificate.png',
        borderRadius: 8,
      ),
    );
  }
}
