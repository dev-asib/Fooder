import 'package:flutter/material.dart';
import 'package:fooder/core/constants/assets_paths/images_paths.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/dual_rich_text.dart';
import 'package:fooder/core/widgets/stock_badge.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/features/food_details/presentations/screens/food_details_screen.dart';

class FoodPromo extends StatelessWidget {
  const FoodPromo({
    super.key,
    required this.fooder,
  });

  final FooderModel fooder;

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: WishIcon(),
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
