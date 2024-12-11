import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/category_model.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/wrappers/svg_viewer.dart';
import 'package:fooder/features/food_list/presentations/screens/food_list_screen.dart';
import 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class FoodCategoryCard extends StatelessWidget {
  const FoodCategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        if (category.categoryName != "More") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodListScreen(
                categoryName: category.categoryName!,
              ),
            ),
          );
        } else {
          Provider.of<MainBottomNavProvider>(context, listen: false)
              .backToCategory();
        }
      },
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
                child: SvgViewer(svgAsset: category.iconPath!)),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            category.categoryName!,
            style: textTheme.titleSmall?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
