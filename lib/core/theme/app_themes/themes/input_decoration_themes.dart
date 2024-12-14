import 'package:flutter/material.dart';

class InputDecorationThemes {
  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFE1E1E1),
      hintStyle: const TextStyle(
        color: Color(0xFF7E7E7E),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      border: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputBorder(),
      enabledBorder: _buildOutlineInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(),
      focusedErrorBorder: _buildOutlineInputBorder(),
    );
  }

  static OutlineInputBorder _buildOutlineInputBorder() {
    return const OutlineInputBorder(borderSide: BorderSide.none);
  }
}
