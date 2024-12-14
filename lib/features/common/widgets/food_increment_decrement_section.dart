import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodIncrementDecrementSection extends StatelessWidget {
  const FoodIncrementDecrementSection({
    super.key,
    required this.totalFoodCount,
    required this.onTapIncrementFood,
    required this.onTapDecrementFood,
  });

  final int totalFoodCount;
  final VoidCallback onTapIncrementFood;
  final VoidCallback onTapDecrementFood;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: FittedBox(
        child: Row(
          children: [
            IncrementDecrementButton(
              icon: Icons.remove,
              onPressed: onTapDecrementFood,
              bgColor: AppColors.kLightGreyColor,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                "$totalFoodCount",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IncrementDecrementButton(
              icon: Icons.add,
              onPressed: onTapIncrementFood,
            ),
          ],
        ),
      ),
    );
  }
}
