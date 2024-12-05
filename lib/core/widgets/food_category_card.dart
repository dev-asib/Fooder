import 'package:flutter/material.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/wrappers/svg_viewer.dart';

class FoodCategoryCard extends StatelessWidget {
  const FoodCategoryCard({
    super.key,
    required this.iconPath,
    required this.categoryTitle,
  });

  final String iconPath;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          Card(
            color: AppColors.kWhiteColor,
            shadowColor: AppColors.kFadedPinkColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
                height: 85,
                width: 85,
                padding: const EdgeInsets.all(24),
                child: SvgViewer(svgAsset: iconPath)),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            categoryTitle,
            style: textTheme.titleSmall?.copyWith(
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }
}
