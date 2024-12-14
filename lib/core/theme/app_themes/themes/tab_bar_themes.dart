import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class TabBarThemes {
  static TabBarTheme tabBarTheme() {
    return TabBarTheme(
      indicator: const BoxDecoration(
        color: AppColors.kPrimaryColor,
      ),
      labelColor: AppColors.kWhiteColor,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: AppColors.kPrimaryColor,
      overlayColor: WidgetStatePropertyAll(Colors.red.shade100),
    );
  }
}
