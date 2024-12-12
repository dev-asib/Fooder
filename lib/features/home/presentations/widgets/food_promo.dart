import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodPromo extends StatelessWidget {
  const FoodPromo({
    super.key,
    required this.fooder,
  });

  final FoodModel fooder;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(fooder: fooder),
          ),
        );
      },
      child: Card(
        color: AppColors.kWhiteColor,
        child: Food(
          height: 280,
          width: 300,
          imgPath: fooder.imgPath ?? ImagesPaths.kFood,
          widget: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: WishIcon(food: fooder),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Card(
                  child: _buildPromoFoodInfoCard(textTheme),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoFoodInfoCard(TextTheme textTheme) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            fooder.foodTitle ?? 'Unknown Title',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: textTheme.titleMedium,
          ),
          Text(
            fooder.foodDetails ?? 'Unknown Details',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Row(
            children: [
              DualRichText(
                primaryText: "TK ${fooder.discountPrice ?? 0}\t\t",
                secondaryText: "${fooder.originalPrice ?? 0}",
              ),
              const Spacer(),
              StockBadge(stockCount: fooder.stockCount ?? 0),
            ],
          ),
        ],
      ),
    );
  }
}
