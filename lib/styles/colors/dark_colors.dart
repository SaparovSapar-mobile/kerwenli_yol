import 'package:flutter/widgets.dart';

class DarkColors {
  DarkColors._();

  // ---------- PRIMARY ----------
  static const Color primary = Color(0xFFFF6600);

  // Linear (gradient) renkleri
  static const Color primaryGradientStart = Color(0xFFFF6600); // #FF6600
  static const Color primaryGradientEnd = Color(0xFFFEE83A); // #FEE83A

  static const List<Color> primaryGradient = [
    primaryGradientStart,
    primaryGradientEnd,
  ];

  // ---------- WARNING / CARD COLORS ----------
  static const Color vipCard = Color(0xFFF8B725); // #F8B725
  static const Color exportCard = Color(0xFFF3960D); // #F3960D
  static const Color newCard = Color(0xFF28C171); // #28C171
  static const Color gradus360 = Color(0xFFFF5050); // #FF5050

  // ---------- INFO COLORS ----------
  static const Color error = Color(0xFFDC2626); // #DC2626
  static const Color success = Color(0xFF047857); // #047857
  static const Color loadingBackground = Color(0xFFF4F2F2); // #F4F2F2

  // ---------- LIGHT BACKGROUND ----------
  // static const Color bgPageLight = Color(0xFFF6F8FD); // #F6F8FD
  // static const Color bgBlogLight = Color(0xFFFFFFFF); // #FFFFFF

  // ---------- DARK BACKGROUND ----------
  static const Color bgPageDark = Color(0xFF3D3C3C); // #3D3C3C
  static const Color bgBlogDark = Color(0xFF333333); // #333333

  // ---------- TEXT COLORS (LIGHT BACKGROUND) ----------
  // static const Color textTitleLight = Color(0xFF262626); // #262626
  // static const Color textDescriptionLight = Color(0xFF90979F); // #90979F

  // ---------- TEXT COLORS (DARK BACKGROUND) ----------
  static const Color textTitleDark = Color(0xFFF6F6F6); // #F6F6F6
  static const Color textDescriptionDark = Color(0xFFCCCCCC);
}
