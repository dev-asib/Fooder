import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodPromo extends StatelessWidget {
  const FoodPromo({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => _onTapFoodPromo(context),
      child: Card(
        color: AppColors.kWhiteColor,
        child: Food(
          height: 280,
          width: 300,
          imgPath: food.imgPath ?? ImagesPaths.kFood,
          widget: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: WishIcon(food: food),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Card(
                  child: _buildPromoFoodInfoCard(textTheme: textTheme),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoFoodInfoCard({required TextTheme textTheme}) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            food.foodTitle ?? 'Unknown Title',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: textTheme.titleMedium,
          ),
          Text(
            food.foodDetails ?? 'Unknown Details',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Row(
            children: [
              DualRichText(
                primaryText: "TK ${food.discountPrice ?? 0}\t\t",
                secondaryText: "${food.originalPrice ?? 0}",
              ),
              const Spacer(),
              StockBadge(stockCount: food.stockCount ?? 0),
            ],
          ),
        ],
      ),
    );
  }

  void _onTapFoodPromo(BuildContext context) {
    Navigator.of(context).pushNamed(
      RouteNames.foodDetailsScreen,
      arguments: food,
    );
  }
}
