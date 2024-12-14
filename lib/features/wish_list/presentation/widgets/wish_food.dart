import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class WishFood extends StatelessWidget {
  const WishFood({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => _onTapWishFood(context),
      child: Card(
        elevation: 3,
        child: FittedBox(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                          "TK ${wishListProvider.totalSubFoodPrice(food)}",
                          style: textTheme.bodyLarge,
                        ),
                        const Gap(8),
                        HorizontalIconIconWithText(
                          title: "${food.reviewList![0].rating}",
                          icon: Icons.star,
                          middleGap: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: WishIcon(food: food),
                ),
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
