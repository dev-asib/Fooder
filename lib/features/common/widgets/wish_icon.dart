import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class WishIcon extends StatelessWidget {
  const WishIcon({
    super.key,
    required this.food,
    this.height = 48,
    this.width = 48,
    this.radius = 100,
  });

  final FoodModel food;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        child: CustomIconButton(
          radius: radius,
          icon: wishListProvider.isAddedFoodToWishList(food)
              ? Icons.favorite
              : Icons.favorite_outline,
          onPressed: () {
            wishListProvider.addToWishListFood(
              context: context,
              food: food,
            );
          },
        ),
      ),
    );
  }
}
