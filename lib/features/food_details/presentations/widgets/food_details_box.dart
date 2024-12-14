import 'package:flutter/material.dart';
import 'package:fooder/core/exported_files/exported_files.dart';

class FoodDetailsBox extends StatelessWidget {
  const FoodDetailsBox({
    super.key,
    required this.food,
    required this.locations,
  });

  final FoodModel food;
  final LocationModel locations;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Positioned(
      bottom: -80,
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTitleText(textTheme),
              _buildLocationText(
                textTheme,
                locations,
              ),
              _buildOperationalTime(
                textTheme,
                locations,
              ),
              _buildFoodInfoRow(
                locations,
                food,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodInfoRow(
    LocationModel locations,
    FoodModel food,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HorizontalIconIconWithText(
          title: locations.distance!,
          icon: Icons.my_location_sharp,
        ),
        HorizontalIconIconWithText(
          title: food.reviewList![0].rating.toString(),
          icon: Icons.star,
        ),
        const HorizontalIconIconWithText(
          title: "Verified",
          icon: Icons.verified_outlined,
        ),
      ],
    );
  }

  Widget _buildTitleText(TextTheme textTheme) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      food.foodTitle!,
      style: textTheme.titleMedium,
    );
  }

  Widget _buildLocationText(
    TextTheme textTheme,
    LocationModel locations,
  ) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      locations.address!,
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildOperationalTime(
    TextTheme textTheme,
    LocationModel locations,
  ) {
    return DualRichText(
      primaryText: "Open\t\t",
      secondaryText: locations.openTime!,
      secondaryTextStyle: textTheme.titleSmall,
    );
  }
}
