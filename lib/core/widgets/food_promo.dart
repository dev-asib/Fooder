import 'package:flutter/material.dart';
import 'package:fooder/core/widgets/wish_icon.dart';
import 'package:fooder/core/widgets/food.dart';
import 'package:gap/gap.dart';

class FoodPromo extends StatelessWidget {
  const FoodPromo({
    super.key,
    this.foodTitle = "Fruit Salad Mix",
    this.foodDetails = "Delics Fruit Salad Ngasem",
    this.originalPrice = 500,
    this.discountPrice = 400,
    this.left = 5,
  });

  final String foodTitle;
  final String foodDetails;
  final double originalPrice;
  final double discountPrice;
  final int left;

  @override
  Widget build(BuildContext context) {
    return Food(
      height: 280,
      width: 300,
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
              child: _buildPromoFoodInfoCard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoFoodInfoCard() {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            foodTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            foodDetails,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Row(
            children: [
              Text("TK: $discountPrice"),
              const Gap(8),
              Text(
                "$originalPrice",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const Spacer(),
              Container(
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDA345),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$left Left",
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
