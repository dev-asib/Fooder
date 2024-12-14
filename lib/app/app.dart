import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class Fooder extends StatefulWidget {
  const Fooder({super.key});

  @override
  State<Fooder> createState() => _FooderState();
}

class _FooderState extends State<Fooder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteNames.mainBottomNavScreen,
      onGenerateRoute: AppRoutes.generateRoute,
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
        tabBarTheme: TabBarTheme(
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
        switchTheme: SwitchThemeData(
          trackColor: WidgetStatePropertyAll(
            AppColors.kPrimaryColor.withOpacity(0.2),
          ),
          thumbColor: const WidgetStatePropertyAll(AppColors.kPrimaryColor),
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFE1E1E1),
          hintStyle: const TextStyle(
              color: Color(0xFF7E7E7E),
              fontSize: 18,
              fontWeight: FontWeight.w500),
          border: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(),
          enabledBorder: _buildOutlineInputBorder(),
          disabledBorder: _buildOutlineInputBorder(),
          errorBorder: _buildOutlineInputBorder(),
          focusedErrorBorder: _buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return const OutlineInputBorder(borderSide: BorderSide.none);
  }
}
