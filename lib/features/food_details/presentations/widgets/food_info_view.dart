import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/widgets/custom_ratings.dart';
import 'package:fooder/core/widgets/dual_rich_text.dart';
import 'package:fooder/features/common/widgets/food_increment_decrement_section.dart';
import 'package:gap/gap.dart';

class FoodInfoView extends StatelessWidget {
  const FoodInfoView({
    super.key,
    required this.fooder,
  });

  final FooderModel fooder;

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
              fooder.foodTitle!,
              style: textThem.titleMedium,
            ),
            const Gap(8),
            Row(
              children: [
                Chip(
                  label: DualRichText(
                    primaryText: "TK ${fooder.discountPrice!}",
                    secondaryText: "${fooder.originalPrice!}",
                  ),
                ),
                const Spacer(),
                const FoodIncrementDecrementSection(totalFoodCount: 1),
              ],
            ),
            const Gap(8),
            Chip(
              label: Row(
                children: [
                  Text(
                    "Reviews ${fooder.totalReviews}",
                    style: textThem.titleMedium,
                  ),
                  const Spacer(),
                  CustomRatings(ratings: fooder.reviewList![0].rating!),
                ],
              ),
            ),
            const Gap(8),
            Text(
              "Description",
              style: textThem.titleMedium,
            ),
            Text(
              fooder.foodDetails!,
              style: textThem.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
