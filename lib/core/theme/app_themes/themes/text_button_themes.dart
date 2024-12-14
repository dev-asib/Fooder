import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class TextButtonThemes {
  static TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kPrimaryColor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
