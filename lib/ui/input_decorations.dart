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
}
