import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';

class FoodInfoView extends StatelessWidget {
  const FoodInfoView({
    super.key,
    required this.food,
    required this.onTapIncrementFood,
    required this.onTapDecrementFood,
    required this.totalFoodCount,
  });

  final FoodModel food;
  final VoidCallback onTapIncrementFood;
  final VoidCallback onTapDecrementFood;
  final int totalFoodCount;

  @override
  Widget build(BuildContext context) {
    final TextTheme textThem = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food.foodTitle!,
              style: textThem.titleMedium,
            ),
            const Gap(8),
            Row(
              children: [
                Chip(
                  label: DualRichText(
                    primaryText: "TK ${food.discountPrice ?? 0}",
                    secondaryText: "${food.originalPrice ?? 0}",
                  ),
                ),
                const Spacer(),
                FoodIncrementDecrementSection(
                  totalFoodCount: totalFoodCount,
                  onTapIncrementFood: onTapIncrementFood,
                  onTapDecrementFood: onTapDecrementFood,
                ),
              ],
            ),
            const Gap(8),
            Chip(
              label: Row(
                children: [
                  Text(
                    "Reviews ${food.totalReviews ?? 0}",
                    style: textThem.titleMedium,
                  ),
                  const Spacer(),
                  CustomRatings(ratings: food.reviewList![0].rating!),
                ],
              ),
            ),
            const Gap(8),
            Text(
              "Description",
              style: textThem.titleMedium,
            ),
            Text(
              food.foodDetails!,
              style: textThem.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
