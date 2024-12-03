import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/features/home/presentations/screens/home_screen.dart';

class Fooder extends StatelessWidget {
  const Fooder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.kWhiteColor,
            foregroundColor: AppColors.kPrimaryColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            fixedSize: const Size.fromHeight(45),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
