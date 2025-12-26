
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0F4479);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color successColor = Color(0xFF06D6A0);
  static const Color errorColor = Color(0xFFEF476F);
  static const Color warningColor = Color(0xFFFFA726);
  static const Color infoColor = Color(0xFF2196F3);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xff415e91), Color(0xff284777)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xff284777), Color(0xff506da0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFE8E8E8),
      Color(0xFFF5F5F5),
      Color(0xFFE8E8E8),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );

  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}