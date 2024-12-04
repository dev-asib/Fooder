import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';

class FoodCategoryCard extends StatelessWidget {
  const FoodCategoryCard({
    super.key,
    required this.icon,
    required this.categoryTitle,
  });

  final IconData icon;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Card(
          color: AppColors.kWhiteColor,
          shadowColor: AppColors.kFadedPinkColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: Colors.red,
              size: 45,
            ),
          ),
        ),
        Text(
          categoryTitle,
          style: textTheme.titleSmall,
        ),
      ],
    );
  }
}
