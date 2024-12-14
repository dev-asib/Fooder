import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class TextThemes {
  static TextTheme textTheme() {
    return TextTheme(
      titleLarge: _textStyle(
        fontSize: 38,
      ),
      titleMedium: _textStyle(
        fontSize: 20,
        color: AppColors.kBlackColor,
      ),
      titleSmall: _textStyle(
        fontSize: 16,
        color: AppColors.kMediumGreyColor,
      ),
      bodySmall: _textStyle(
        fontSize: 16,
        color: AppColors.kWhiteColor,
      ),
      bodyLarge: _textStyle(),
    );
  }

  static TextStyle _textStyle({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: color,
    );
  }
}
