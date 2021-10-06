import 'package:flutter/material.dart';
import 'package:pedidos_app/utils/properties_util.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: PropertiesUtil.primaryColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: PropertiesUtil.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: PropertiesUtil.onboardingTextBodyColor,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: PropertiesUtil.primaryColor)
          : null,
    );
  }

  static InputDecoration searchHomeInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Color(0xFFE6E7E9),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF9CA3AF),
      ),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Color(0xFF9CA3AF))
          : null,
    );
  }
}
