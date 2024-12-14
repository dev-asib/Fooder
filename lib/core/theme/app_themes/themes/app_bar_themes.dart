import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class AppBarThemes {
  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.kDarkCharcoalColor,
      foregroundColor: AppColors.kPrimaryColor,
      titleTextStyle: TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: 28,
        fontFamily: "BlackOpsOne",
      ),
      surfaceTintColor: AppColors.kDarkCharcoalColor,
    );
  }
}
