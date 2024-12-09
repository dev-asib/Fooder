import 'package:flutter/material.dart';
import 'package:fooder/core/data/models/fooder_model.dart';
import 'package:fooder/core/theme/app_colors/app_colors.dart';
import 'package:fooder/core/widgets/dual_rich_text.dart';
import 'package:fooder/core/widgets/horizontal_icon_with_text.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:fooder/core/widgets/stock_badge.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:fooder/features/cart/providers/cart_provider.dart';
import 'package:fooder/features/common/widgets/food_increment_decrement_section.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class FoodCardTile extends StatelessWidget {
  const FoodCardTile({
    super.key,
    required this.fooder,
  });

  final FooderModel fooder;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
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
                const FoodIncrementDecrementSection(totalFoodCount: 1),
                const Spacer(),
                _foodAddButton(
                  context: context,
                  cartProvider: cartProvider,
                  fooder: fooder,
                ),
              ],
            ),
          ],
        ),
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
           Positioned(
            top: 4,
            right: 4,
            child: WishIcon(food: fooder),
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
          DualRichText(
            primaryText: "TK ${fooder.discountPrice ?? 0}\t\t",
            secondaryText: "${fooder.originalPrice ?? 0}",
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
    required CartProvider cartProvider,
    required FooderModel fooder,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        cartProvider.addToCartListFood(
          context: context,
          food: fooder,
        );
      },
      icon:
          Icon(cartProvider.isAddedFood(fooder) ? Icons.check : Icons.add),
      label: Text(cartProvider.isAddedFood(fooder) ? "Added." : "Add"),
    );
  }
}
