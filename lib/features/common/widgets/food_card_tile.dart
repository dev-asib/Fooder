import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class FoodCardTile extends StatelessWidget {
  const FoodCardTile({
    super.key,
    required this.food,
    required this.onTapIncrementFood,
    required this.onTapDecrementFood,
    required this.totalFoodItem,
  });

  final FoodModel food;
  final VoidCallback onTapIncrementFood;
  final VoidCallback onTapDecrementFood;
  final int totalFoodItem;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartListProvider>(context);

    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => _onTapFoodCart(context),
      child: Card(
        color: AppColors.kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFoodImageSection(),
                  const Gap(16),
                  Expanded(
                    child: _buildFoodInfoSection(textTheme),
                  ),
                ],
              ),
              Row(
                children: [
                  FoodIncrementDecrementSection(
                    totalFoodCount: totalFoodItem,
                    onTapIncrementFood: onTapIncrementFood,
                    onTapDecrementFood: onTapDecrementFood,
                  ),
                  const Spacer(),
                  _foodAddButton(
                    context: context,
                    cartProvider: cartProvider,
                    food: food,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodImageSection() {
    return Food(
      height: 120,
      width: 145,
      imgPath: food.imgPath!,
      widget: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            top: 4,
            right: 4,
            child: WishIcon(food: food),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: StockBadge(stockCount: food.stockCount ?? 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodInfoSection(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            food.foodTitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium,
          ),
          Text(
            food.foodDetails!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge,
          ),
          DualRichText(
            primaryText: "TK ${food.discountPrice ?? 0}\t\t",
            secondaryText: "${food.originalPrice ?? 0}",
          ),
          const HorizontalIconIconWithText(
            title: "Free Delivery",
            icon: Icons.percent_sharp,
            iconBgColor: AppColors.kAmberYellowColor,
            iconColor: AppColors.kWhiteColor,
          ),
        ],
      ),
    );
  }

  Widget _foodAddButton({
    required BuildContext context,
    required CartListProvider cartProvider,
    required FoodModel food,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        cartProvider.addToCartListFood(
          context: context,
          food: food,
        );
      },
      icon: Icon(cartProvider.isAddedFood(food) ? Icons.check : Icons.add),
      label: Text(cartProvider.isAddedFood(food) ? "Added." : "Add"),
    );
  }

  void _onTapFoodCart(BuildContext context) {
    Navigator.of(context).pushNamed(
      RouteNames.foodDetailsScreen,
      arguments: food,
    );
  }
}
