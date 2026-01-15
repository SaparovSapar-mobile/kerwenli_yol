import 'package:flutter/material.dart';

class PhotosViewArrowButton extends StatelessWidget {
  const PhotosViewArrowButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // ====== Colors =====
    Color bgColor = const Color(0xFF1d1b1b);
    Color iconColor = Colors.white;

    final disabled = onTap == null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: disabled ? 0.25 : 1.0,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 24),
          ),
        ),
      ),
    );
  }
}
