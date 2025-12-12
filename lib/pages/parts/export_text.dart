import 'package:flutter/material.dart';

class ExportText extends StatelessWidget {
  const ExportText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -6,
      child: Container(
        width: 32,
        height: 18,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: const Color(0xFFF3690D),
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Text(
          "Export",
          style: TextStyle(
            color: Colors.white,
            fontSize: 6,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
