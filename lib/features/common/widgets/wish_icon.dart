import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:provider/provider.dart';

class WishIcon extends StatelessWidget {
  const WishIcon({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return CustomIconButton(
      icon: wishListProvider.isAddedFoodToWishList(food)
          ? Icons.favorite
          : Icons.favorite_outline,
      onPressed: () {
        wishListProvider.addToWishListFood(
          context: context,
          food: food,
        );
      },
    );
  }
}
