import 'package:flutter/material.dart';

class VipText extends StatelessWidget {
  const VipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -6,
      child: Container(
        width: 32,
        height: 18,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: const Color(0xFFFBB725),
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Text(
          "VIP",
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
