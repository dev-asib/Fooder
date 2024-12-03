import 'package:flutter/material.dart';
import 'package:fooder/core/constants/assets_paths/assets_paths.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/custom_icon_button.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:fooder/core/widgets/stock_badge.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:gap/gap.dart';

class FoodCardTile extends StatelessWidget {
  const FoodCardTile({
    super.key,
    required this.titleText,
    required this.descriptionText,
    required this.originalPrice,
    required this.discountPrice,
    required this.stockCount,
    required this.totalFoodCount,
  });

  final String titleText;
  final String descriptionText;
  final double originalPrice;
  final double discountPrice;
  final int stockCount;
  final int totalFoodCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFoodImageSection(),
              const Gap(16),
              _buildFoodInfoSection(textTheme),
            ],
          ),
          Row(
            children: [
              _buildFoodIncrementDecrementSection(
                context: context,
                totalFoodCount: totalFoodCount,
              ),
              const Spacer(),
              _buildFoodAddButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFoodImageSection() {
    return Food(
      height: 120,
      width: 145,
      imgPath: AssetsPaths.food,
      widget: Stack(
        alignment: Alignment.topRight,
        children: [
          const Positioned(
            top: 4,
            right: 4,
            child: WishIcon(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: StockBadge(stockCount: stockCount),
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
            titleText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
          Text(
            descriptionText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium,
          ),
          Row(
            children: [
              Text(
                "TK $discountPrice",
                style: textTheme.titleMedium,
              ),
              const Gap(8),
              Text(
                "$originalPrice",
                style: textTheme.titleMedium?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.kGreyColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.kAmberYellowColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.percent,
                  color: AppColors.kWhiteColor,
                  size: 16,
                ),
              ),
              const Gap(8),
              Text(
                "Free Delivery",
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFoodAddButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text("Add"),
    );
  }
}

Widget _buildFoodIncrementDecrementSection({
  required BuildContext context,
  required int totalFoodCount,
}) {
  return SizedBox(
    width: 150,
    child: FittedBox(
      child: Row(
        children: [
          IncrementDecrementButton(
            icon: Icons.remove,
            onPressed: () {},
            bgColor: AppColors.kLightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              "$totalFoodCount",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          IncrementDecrementButton(
            icon: Icons.add,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
