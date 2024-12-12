import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodIncrementDecrementSection extends StatelessWidget {
  const FoodIncrementDecrementSection({
    super.key,
    required this.totalFoodCount,
  });

  final int totalFoodCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: FittedBox(
        child: Row(
          children: [
            IncrementDecrementButton(
              icon: Icons.remove,
              onPressed: () {},
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
