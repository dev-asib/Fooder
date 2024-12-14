import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class AppThemes {
  static ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.kScaffoldBgColor,
      colorSchemeSeed: AppColors.kPrimaryColor,
      appBarTheme: AppBarThemes.appBarTheme(),
      iconButtonTheme: IconButtonThemes.iconButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemes.elevatedButtonThemeData(),
      textButtonTheme: TextButtonThemes.textButtonThemeData(),
      textTheme: TextThemes.textTheme(),
      tabBarTheme: TabBarThemes.tabBarTheme(),
      chipTheme: ChipThemes.chipThemeData(),
      switchTheme: SwitchThemes.switchThemeData(),
      inputDecorationTheme: InputDecorationThemes.inputDecorationTheme(),
    );
  }
}
