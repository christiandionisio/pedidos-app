import 'package:flutter/material.dart';

class PropertiesUtil {
  static const Color primaryColor = Color(0xFF32B768);
  static const Color primaryColorOutlined = Color(0xFFD1FAE5);

  // Colores para contenido de sección onboarding y registration
  static const Color dotsColor = Color(0xFFE6E6E6);
  static const Color onboardingTextBodyColor = Color(0xFF4B5563);
  static const Color unselectedTabText = Color(0xFF89909E);

  static const TextStyle titleStyle =
      TextStyle(fontSize: 26, fontWeight: FontWeight.w700);

  static final ButtonStyle stylePrimaryButton = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
  );
}
