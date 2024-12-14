import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class IconButtonThemes {
  static IconButtonThemeData iconButtonThemeData() {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.kFadedPinkColor,
        foregroundColor: AppColors.kPrimaryColor,
      ),
    );
  }
}
