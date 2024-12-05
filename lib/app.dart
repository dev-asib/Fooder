import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/features/main_bottom_nav/presentation/screens/main_bottom_nav_screen.dart';

class Fooder extends StatelessWidget {
  const Fooder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainBottomNavScreen(),
      theme: ThemeData(
        useMaterial3: true,
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
            fontSize: 38,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.kBlackColor
          ),
          titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.kMediumGreyColor,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
