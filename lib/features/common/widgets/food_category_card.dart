import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
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
      onTap: () => _onTapCategory(context),
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

  void _onTapCategory(BuildContext context) {
    if (category.categoryName != "More") {
      Navigator.of(context).pushNamed(
        RouteNames.foodListScreen,
        arguments: category.categoryName!,
      );
    } else {
      Provider.of<MainBottomNavProvider>(context, listen: false)
          .backToCategory();
    }
  }
}
