import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class WishFood extends StatelessWidget {
  const WishFood({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => _onTapWishFood(context),
      child: Card(
        elevation: 3,
        color: AppColors.kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Food(imgPath: food.imgPath!),
              Text(
                food.foodTitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
              Text(
                food.foodDetails!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TK ${food.discountPrice ?? 0}",
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  HorizontalIconIconWithText(
                    title: "${food.reviewList![0].rating}",
                    icon: Icons.star,
                    middleGap: 1,
                    iconSize: 18,
                    fontSize: 15,
                  ),
                  WishIcon(
                    food: food,
                    height: 28,
                    width: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapWishFood(BuildContext context) {
    Navigator.of(context).pushNamed(
      RouteNames.foodDetailsScreen,
      arguments: food,
    );
  }
}
