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
        scaffoldBackgroundColor: AppColors.kScaffoldBgColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kDarkCharcoalColor,
          foregroundColor: AppColors.kPrimaryColor,
          titleTextStyle: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 28,
            fontFamily: "BlackOpsOne",
          ),
          surfaceTintColor: AppColors.kDarkCharcoalColor,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.kFadedPinkColor,
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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.kPrimaryColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
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
              color: AppColors.kBlackColor),
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
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        tabBarTheme:  TabBarTheme(
          indicator: const BoxDecoration(
            color: AppColors.kPrimaryColor,
          ),
          labelColor: AppColors.kWhiteColor,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColors.kPrimaryColor,
          overlayColor: WidgetStatePropertyAll(Colors.red.shade100),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: AppColors.kWhiteColor,
        ),
      ),
    );
  }
}
