import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class SwitchThemes {
  static SwitchThemeData switchThemeData() {
    return SwitchThemeData(
      trackColor: WidgetStatePropertyAll(
        AppColors.kPrimaryColor.withOpacity(0.2),
      ),
      thumbColor: const WidgetStatePropertyAll(AppColors.kPrimaryColor),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
    );
  }
}
