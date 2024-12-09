import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/widgets/custom_icon_button.dart';
import 'package:fooder/features/wish_list/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';

class WishIcon extends StatelessWidget {
  const WishIcon({
    super.key,
    required this.food,
  });

  final FooderModel food;

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
