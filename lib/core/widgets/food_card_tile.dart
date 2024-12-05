import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/increment_decrement_button.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:fooder/core/widgets/stock_badge.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:gap/gap.dart';

class FoodCardTile extends StatelessWidget {
  const FoodCardTile({
    super.key,
    required this.fooder,
  });

  final FooderModel fooder;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: AppColors.kWhiteColor,
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
              _buildFoodIncrementDecrementSection(
                textTheme: textTheme,
                totalFoodCount: 1,
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
      imgPath: fooder.imgPath!,
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
              child: StockBadge(stockCount: fooder.stockCount ?? 0),
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
            fooder.foodTitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium,
          ),
          Text(
            fooder.foodDetails!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge,
          ),

          RichText(
            text: TextSpan(
              style: textTheme.bodyLarge,
              children: [
                TextSpan(text: "TK ${fooder.discountPrice ?? 0}\t\t"),
                TextSpan(
                    style: textTheme.titleSmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                    text: "${fooder.originalPrice ?? 0}"),
              ],
            ),
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
                style: textTheme.bodyLarge,
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
  required TextTheme textTheme,
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
              style: textTheme.titleMedium,
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
